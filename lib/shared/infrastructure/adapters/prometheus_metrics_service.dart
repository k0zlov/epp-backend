import 'dart:async';
import 'package:epp_backend/shared/application/base/metrics_definition.dart';
import 'package:epp_backend/shared/application/ports/metrics_service.dart';
import 'package:prometheus_client/prometheus_client.dart';

class PrometheusMetricsService implements MetricsService {
  final CollectorRegistry _registry = CollectorRegistry();

  final Map<String, Collector> _metricsCache = {};

  T _getOrRegister<T extends Collector>(MetricDefinition def, T Function() factory) {
    if (_metricsCache.containsKey(def.name)) {
      return _metricsCache[def.name]! as T;
    }

    final collector = factory();
    _registry.register(collector);
    _metricsCache[def.name] = collector;

    return collector;
  }

  @override
  void increment(MetricDefinition metric, {Map<String, String>? labels}) {
    final collector = _getOrRegister(
      metric,
      () => Counter(
        name: metric.name,
        help: metric.help,
        labelNames: labels?.keys.toList() ?? [],
      ),
    );

    if (labels != null) {
      collector.labels(labels.values.toList()).inc();
    } else {
      collector.inc();
    }
  }

  @override
  void setGauge(MetricDefinition metric, int value, {Map<String, String>? labels}) {
    final collector = _getOrRegister(
      metric,
      () => Gauge(
        name: metric.name,
        help: metric.help,
        labelNames: labels?.keys.toList() ?? [],
      ),
    );

    if (labels != null) {
      collector.labels(labels.values.toList()).value = value.toDouble();
    } else {
      collector.value = value.toDouble();
    }
  }

  @override
  void recordDuration(MetricDefinition metric, int ms, {Map<String, String>? labels}) {
    final collector = _getOrRegister(
      metric,
      () => Histogram(
        name: metric.name,
        help: metric.help,
        labelNames: labels?.keys.toList() ?? [],
      ),
    );

    final seconds = ms / 1000.0;
    if (labels != null) {
      collector.labels(labels.values.toList()).observe(seconds);
    } else {
      collector.observe(seconds);
    }
  }

  @override
  Future<String> expose() async {
    final buffer = StringBuffer();
    final metrics = await _registry.collectMetricFamilySamples();

    for (final family in metrics) {
      buffer
        ..writeln('# HELP ${family.name} ${family.help}')
        ..writeln('# TYPE ${family.name} ${family.type.name.toLowerCase()}');
      for (final sample in family.samples) {
        final labelString = sample.labelNames.isEmpty
            ? ''
            : '{${List.generate(sample.labelNames.length, (i) => '${sample.labelNames[i]}="${sample.labelValues[i]}"').join(',')}}';
        buffer.writeln('${sample.name}$labelString ${sample.value}');
      }
    }

    return buffer.toString();
  }
}
