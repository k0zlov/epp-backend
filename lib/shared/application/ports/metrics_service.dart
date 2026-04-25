import 'package:epp_backend/shared/application/base/metrics_definition.dart';

abstract interface class MetricsService {
  void increment(MetricDefinition metric, {Map<String, String>? labels});

  void setGauge(MetricDefinition metric, int value, {Map<String, String>? labels});

  void recordDuration(MetricDefinition metric, int ms, {Map<String, String>? labels});

  Future<String> expose();
}
