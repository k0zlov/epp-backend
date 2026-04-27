import 'dart:async';
import 'dart:io';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/infrastructure/base/presentation_error.dart';
import 'package:epp_backend/shared/presentation/presentation.dart';
import 'package:ruta/ruta.dart';

class ErrorMiddleware extends Middleware {
  ErrorMiddleware({
    required this.loggerService,
    required this.metricsService,
  });

  final LoggerService loggerService;
  final MetricsService metricsService;

  @override
  Handler call(Handler handler) {
    return (Request request) async {
      if (request.isSocketConnection) return handler(request);

      final String? traceId = Zone.current[#traceId] as String?;

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
              ...e.details,
            },
          ),
        );

        metricsService.increment(
          MetricDefinition.infrastructureErrors,
          labels: {
            'service': e.code.service,
            'error_code': e.code.value,
          },
        );

        final error = PresentationError(
          statusCode: HttpStatus.internalServerError,
          code: 'InternalServerError',
          message: 'Something went wrong on our side.',
          details: {'traceId': traceId, 'infrastructure_code': e.code.value},
        );

        return Response.json(
          statusCode: error.statusCode,
          body: error.toJson(),
        ).withError(error);
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
          MetricDefinition.infrastructureErrors,
          labels: {
            'service': InfrastructureErrorCode.unexpectedError.service,
            'error_code': InfrastructureErrorCode.unexpectedError.value,
          },
        );

        final error = PresentationError(
          statusCode: HttpStatus.internalServerError,
          code: 'UnexpectedError',
          message: 'An unexpected error occurred.',
          details: {'traceId': traceId},
        );

        return Response.json(
          statusCode: error.statusCode,
          body: error.toJson(),
        ).withError(error);
      }
    };
  }
}
