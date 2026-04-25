import 'dart:io';

import 'package:epp_backend/shared/application/ports/metrics_service.dart';
import 'package:ruta/annotations.dart';
import 'package:ruta/ruta.dart';

@rutaRoute
class MetricsRoute extends Route {
  MetricsRoute({required this.metricsService});

  final MetricsService metricsService;

  @override
  String get name => 'metrics';

  Endpoint get connect {
    return Endpoint.get(
      path: '',
      handler: (req) async {
        final report = await metricsService.expose();

        return Response(
          body: report,
          headers: {
            HttpHeaders.contentTypeHeader: ContentType.text.value,
          },
        );
      },
    );
  }
}
