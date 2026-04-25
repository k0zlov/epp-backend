import 'dart:io';
import 'package:epp_backend/shared/application/base/infrastructure_exception.dart';
import 'package:epp_backend/shared/application/base/log_context.dart';
import 'package:epp_backend/shared/application/base/metrics_definition.dart';
import 'package:epp_backend/shared/application/ports/logger_service.dart';
import 'package:epp_backend/shared/application/ports/metrics_service.dart';
import 'package:epp_backend/shared/infrastructure/base/presentation_error.dart';
import 'package:epp_backend/shared/presentation/extensions/request_x.dart';
import 'package:ruta/ruta.dart';

class ErrorMiddleware extends Middleware {
  ErrorMiddleware({
    required this.metricsService,
    required this.loggerService,
  });

  final LoggerService loggerService;
  final MetricsService metricsService;

  @override
  Handler call(Handler handler) {
    return (Request request) async {
      if (request.isSocketConnection) return handler(request);

      try {
        return await handler(request);
      } on InfrastructureException catch (e) {
        loggerService.error(
          'Infrastructure error: ${e.message}',
          error: e.error,
          stackTrace: e.stackTrace,
          context: LogContext(
            event: 'http.infrastructure_failure',
            payload: {
              'path': request.url.path,
              'method': request.method.value,
              'errorCode': e.code.value,
              'errorMessage': e.message,
            },
          ),
        );

        metricsService.increment(
          MetricDefinition.httpErrors,
          labels: {
            'type': 'infrastructure_error',
            'errorCode': e.code.value,
            'path': request.url.path,
          },
        );

        return Response.json(
          statusCode: HttpStatus.internalServerError,
          body: const PresentationError(
            statusCode: HttpStatus.internalServerError,
            code: 'InternalServerError',
            message: 'Something went wrong on our side.',
          ).toJson(),
        );
      } catch (e, st) {
        loggerService.error(
          'Unexpected error: $e',
          error: e,
          stackTrace: st,
          context: LogContext(
            event: 'http.unexpected_error',
            payload: {
              'path': request.url.path,
              'method': request.method.value,
            },
          ),
        );

        metricsService.increment(
          MetricDefinition.httpErrors,
          labels: {
            'type': 'unexpected_error',
            'path': request.url.path,
          },
        );

        return Response.json(
          statusCode: HttpStatus.internalServerError,
          body: const PresentationError(
            statusCode: HttpStatus.internalServerError,
            code: 'UnexpectedError',
            message: 'An unexpected error occurred.',
          ).toJson(),
        );
      }
    };
  }
}
