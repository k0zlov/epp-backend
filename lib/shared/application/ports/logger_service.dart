import 'package:epp_backend/shared/application/base/log_context.dart';

abstract interface class LoggerService {
  void info(String message, {LogContext? context});

  void warning(String message, {LogContext? context});

  void error(
    String message, {
    LogContext? context,
    dynamic error,
    StackTrace? stackTrace,
  });
}
