// import 'package:epp_backend/shared/application/application.dart';
// import 'package:epp_backend/shared/application/base/metrics_definition.dart';
// import 'package:epp_backend/shared/infrastructure/adapters/prometheus_metrics_service.dart';
// import 'package:epp_backend/shared/infrastructure/infrastructure.dart';
// import 'package:epp_backend/shared/infrastructure/sanitizers/log_sanitizer.dart';
//
// void main() async {
//   final sanitizer = LogSanitizer();
//   final logger = ConsoleLoggerService(sanitizer: sanitizer);
//   final metrics = PrometheusMetricsService();
//
//   print('--- 1. Logging and PII Test ---');
//
//   logger.info(
//     'New user registration attempt',
//     context: const LogContext(
//       event: 'user_registration',
//       payload: {'email': 'john.doe@gmail.com', 'password': 'secret_password_123', 'ip': '192.168.1.1'},
//     ),
//   );
//
//   print('\n--- 2. Metrics Test (Counter) ---');
//
//   for (var i = 0; i < 3; i++) {
//     metrics.increment(
//       MetricDefinition.httpRequests,
//       labels: {'path': '/login', 'status': '200'},
//     );
//   }
//   print('Injected 3 login requests into metrics.');
//
//   print('\n--- 3. Metrics Test (Gauge) ---');
//
//   metrics.setGauge(MetricDefinition.activeSessions, 10);
//   print('Set active sessions to 10');
//
//   metrics.setGauge(MetricDefinition.activeSessions, 9);
//   print('Set active sessions to 9');
//
//   print('\n--- 4. Error Handling Test (Error) ---');
//
//   try {
//     throw Exception('Database connection timeout');
//   } catch (e, st) {
//     logger.error(
//       'Failed to fetch user data',
//       error: e,
//       stackTrace: st,
//       context: const LogContext(event: 'db_error'),
//     );
//     metrics.increment(
//       MetricDefinition.httpErrors,
//       labels: {'type': 'database'},
//     );
//   }
//
//   print('\n--- 5. Metrics Export (Prometheus Format) ---');
//
//   final report = await metrics.expose();
//   print('FINAL METRICS REPORT:');
//   print('-------------------------------------------');
//   print(report);
//   print('-------------------------------------------');
// }
