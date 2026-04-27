import 'package:prometheus_client/prometheus_client.dart';

enum MetricDefinition {
  httpRequests(
    'http_requests_total',
    'Total number of incoming HTTP requests',
    MetricType.counter,
    ['method', 'path', 'status'],
  ),
  activeSessions(
    'active_user_sessions',
    'Current number of active WebSocket sessions',
    MetricType.gauge,
    [],
  ),
  httpErrors(
    'http_errors_total',
    'Total number of failed request executions',
    MetricType.counter,
    ['type', 'path'],
  ),
  infrastructureErrors(
    'infrastructure_errors_total',
    'Total number of infrastructure failures (DB, External APIs)',
    MetricType.counter,
    ['service', 'error_code'],
  ),
  requestDuration(
    'http_request_duration_seconds',
    'Latency of HTTP request execution in seconds',
    MetricType.histogram,
    ['method', 'path', 'status'],
  ),
  mailSent(
    'mail_sent_total',
    'Total number of successfully sent emails',
    MetricType.counter,
    ['template'],
  ),
  domainEvents(
    'domain_events_total',
    'Total number of domain events published',
    MetricType.counter,
    ['event_type'],
  )
  ;

  const MetricDefinition(
    this.name,
    this.help,
    this.type,
    this.labelNames,
  );

  final String name;
  final String help;
  final MetricType type;
  final List<String> labelNames;
}
