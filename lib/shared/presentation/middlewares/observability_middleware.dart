import 'dart:io';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/infrastructure/base/presentation_error.dart';
import 'package:epp_backend/shared/presentation/extensions/response_x.dart';
import 'package:ruta/ruta.dart';

class ObservabilityMiddleware extends Middleware {
  ObservabilityMiddleware({
    required this.metricsService,
    required this.loggerService,
  });

  final MetricsService metricsService;
  final LoggerService loggerService;

  @override
  Handler call(Handler handler) {
    return (Request request) async {
      final ignoredPaths = ['metrics', 'favicon.ico', 'ws/connect'];

      if (ignoredPaths.contains(request.url.path)) {
        return handler(request);
      }

      final stopwatch = Stopwatch()..start();

      loggerService.info(
        '--> ${request.method.value} ${request.url.path}',
        context: LogContext(
          event: 'http.request_started',
          payload: {
            'method': request.method.value,
            'path': request.url.path,
          },
        ),
      );

      final response = await handler(request);
      stopwatch.stop();
      final duration = stopwatch.elapsedMilliseconds;

      final presentationError = response.presentationError;
      final errorDetails = presentationError?.details;

      _recordMetrics(
        method: request.method.value,
        path: request.url.path,
        statusCode: response.statusCode,
        durationMs: duration,
        error: presentationError,
      );

      loggerService.info(
        '<-- ${response.statusCode} ${request.method.value} ${request.url.path} (${duration}ms)',
        context: LogContext(
          event: 'http.request_finished',
          payload: {
            'method': request.method.value,
            'path': request.url.path,
            'status': response.statusCode,
            'duration_ms': duration,
            'content_length': response.headers[HttpHeaders.contentLengthHeader],
            if (presentationError != null) ...{
              'error_code': presentationError.code,
              'error_message': presentationError.message,
              if (errorDetails != null && errorDetails.isNotEmpty) 'error_details': presentationError.details,
            },
          },
        ),
      );

      return response;
    };
  }

  void _recordMetrics({
    required String method,
    required String path,
    required int statusCode,
    required int durationMs,
    PresentationError? error,
  }) {
    final labels = {
      'method': method,
      'path': path,
      'status': statusCode.toString(),
    };

    metricsService
      ..increment(MetricDefinition.httpRequests, labels: labels)
      ..recordDuration(MetricDefinition.requestDuration, durationMs, labels: labels);

    if (statusCode >= 400) {
      metricsService.increment(
        MetricDefinition.httpErrors,
        labels: {
          'path': path,
          'type': error?.code ?? 'unknown_error',
        },
      );
    }
  }
}
