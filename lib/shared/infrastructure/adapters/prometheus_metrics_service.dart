import 'dart:async';
import 'package:epp_backend/shared/application/application.dart';
import 'package:prometheus_client/prometheus_client.dart';

class PrometheusMetricsService implements MetricsService {
  PrometheusMetricsService() {
    _initialize();
  }

  final CollectorRegistry _registry = CollectorRegistry();
  final Map<MetricDefinition, Collector> _metrics = <MetricDefinition, Collector>{};

  void _initialize() {
    for (final MetricDefinition def in MetricDefinition.values) {
      final Collector collector = _createCollector(def);
      _registry.register(collector);
      _metrics[def] = collector;
    }
  }

  Collector _createCollector(MetricDefinition def) {
    return switch (def.type) {
      MetricType.counter => Counter(
        name: def.name,
        help: def.help,
        labelNames: def.labelNames,
      ),
      MetricType.gauge => Gauge(
        name: def.name,
        help: def.help,
        labelNames: def.labelNames,
      ),
      MetricType.histogram => Histogram(
        name: def.name,
        help: def.help,
        labelNames: def.labelNames,
      ),
      MetricType.summary => Summary(
        name: def.name,
        help: def.help,
        labelNames: def.labelNames,
      ),
      _ => throw UnsupportedError('Metric type ${def.type} not supported'),
    };
  }

  @override
  void increment(MetricDefinition metric, {Map<String, String>? labels}) {
    final Counter counter = _metrics[metric]! as Counter;

    if (metric.labelNames.isEmpty) {
      counter.inc();
    } else {
      counter.labels(_extractLabelValues(metric, labels)).inc();
    }
  }

  @override
  void setGauge(MetricDefinition metric, int value, {Map<String, String>? labels}) {
    final Gauge gauge = _metrics[metric]! as Gauge;

    if (metric.labelNames.isEmpty) {
      gauge.value = value.toDouble();
    } else {
      gauge.labels(_extractLabelValues(metric, labels)).value = value.toDouble();
    }
  }

  @override
  void recordDuration(MetricDefinition metric, int ms, {Map<String, String>? labels}) {
    final Histogram histogram = _metrics[metric]! as Histogram;
    final double seconds = ms / 1000.0;

    if (metric.labelNames.isEmpty) {
      histogram.observe(seconds);
    } else {
      histogram.labels(_extractLabelValues(metric, labels)).observe(seconds);
    }
  }

  List<String> _extractLabelValues(MetricDefinition def, Map<String, String>? labels) {
    return def.labelNames.map((name) => labels?[name] ?? 'unknown').toList();
  }

  @override
  Future<String> expose() async {
    final StringBuffer buffer = StringBuffer();
    final Iterable<MetricFamilySamples> families = await _registry.collectMetricFamilySamples();

    for (final MetricFamilySamples family in families) {
      buffer
        ..writeln('# HELP ${family.name} ${family.help}')
        ..writeln('# TYPE ${family.name} ${family.type.name.toLowerCase()}');

      for (final Sample sample in family.samples) {
        final List<String> labelParts = <String>[];
        for (int i = 0; i < sample.labelNames.length; i++) {
          labelParts.add('${sample.labelNames[i]}="${sample.labelValues[i]}"');
        }

        final String labelsString = labelParts.isEmpty ? '' : '{${labelParts.join(',')}}';
        buffer.writeln('${sample.name}$labelsString ${sample.value}');
      }
    }
    return buffer.toString();
  }
}
