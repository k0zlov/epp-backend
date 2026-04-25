import 'package:epp_backend/shared/application/base/metrics_definition.dart';
import 'package:epp_backend/shared/application/ports/metrics_service.dart';
import 'package:ruta/ruta.dart';

class MetricsMiddleware extends Middleware {
  MetricsMiddleware({required this.metricsService});

  final MetricsService metricsService;

  @override
  Handler call(Handler handler) {
    return (Request request) async {
      final ignoredPaths = ['metrics', 'favicon.ico', 'ws/connect'];

      if (ignoredPaths.contains(request.url.path)) {
        return handler(request);
      }

      final stopwatch = Stopwatch()..start();

      final response = await handler(request);

      _recordMetrics(
        method: request.method.value,
        path: request.url.path,
        statusCode: response.statusCode,
        durationMs: stopwatch.elapsedMilliseconds,
      );

      return response;
    };
  }

  void _recordMetrics({
    required String method,
    required String path,
    required int statusCode,
    required int durationMs,
  }) {
    final labels = {
      'method': method,
      'path': path,
      'status': statusCode.toString(),
    };

    metricsService
      ..increment(
        MetricDefinition.httpRequests,
        labels: labels,
      )
      ..recordDuration(
        MetricDefinition.requestDuration,
        durationMs,
        labels: labels,
      );
  }
}
