enum MetricDefinition {
  httpRequests('http_requests_total', 'Total number of incoming HTTP requests'),
  activeSessions('active_user_sessions', 'Current number of active WebSocket sessions'),
  httpErrors('http_errors_total', 'Total number of failed request executions'),
  requestDuration('http_request_duration_seconds', 'Latency of HTTP request execution in seconds'),
  authCodesCreated('auth_codes_created_total', 'Total number of generated authorization codes')
  ;

  const MetricDefinition(this.name, this.help);

  final String name;
  final String help;
}
