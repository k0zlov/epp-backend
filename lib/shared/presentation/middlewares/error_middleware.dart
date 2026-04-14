import 'dart:io';
import 'package:epp_backend/shared/application/base/exceptions.dart';
import 'package:epp_backend/shared/application/ports/logger_service.dart';
import 'package:epp_backend/shared/presentation/base/presentation_error.dart';
import 'package:ruta/ruta.dart';

class ErrorMiddleware extends Middleware {
  ErrorMiddleware({required this.loggerService});

  final LoggerService loggerService;

  @override
  Handler call(Handler handler) {
    return (Request request) async {
      try {
        return await handler(request);
      } on InfrastructureException catch (e) {
        loggerService.error(
          'Infrastructure error: ${e.message}',
          e.error,
          e.stackTrace,
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
        loggerService.error('Unexpected error: $e', e, st);

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
