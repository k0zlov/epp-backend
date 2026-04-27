import 'dart:async';
import 'dart:convert';

import 'package:epp_backend/shared/application/base/log_context.dart';
import 'package:epp_backend/shared/application/ports/logger_service.dart';
import 'package:epp_backend/shared/infrastructure/loggers/json_log_printer.dart';
import 'package:epp_backend/shared/infrastructure/sanitizers/log_sanitizer.dart';
import 'package:logger/logger.dart';

class ConsoleLoggerService implements LoggerService {
  ConsoleLoggerService({
    bool silent = false,
    bool isDevelopment = true,
    LogSanitizer? sanitizer,
  }) : _logger = Logger(
         level: silent ? Level.off : Level.all,
         filter: ProductionFilter(),
         printer: isDevelopment
             ? PrettyPrinter(
                 methodCount: 0,
                 errorMethodCount: 30,
                 printEmojis: false,
                 dateTimeFormat: DateTimeFormat.dateAndTime,
               )
             : JsonLogPrinter(),
       ),
       _sanitizer = sanitizer ?? LogSanitizer();

  final Logger _logger;
  final LogSanitizer _sanitizer;

  @override
  void info(String message, {LogContext? context}) {
    _logger.i(_buildMessage(message, context));
  }

  @override
  void warning(String message, {LogContext? context}) {
    _logger.w(_buildMessage(message, context));
  }

  @override
  void error(String message, {LogContext? context, dynamic error, StackTrace? stackTrace}) {
    _logger.e(_buildMessage(message, context), error: error, stackTrace: stackTrace);
  }

  String _buildMessage(String message, LogContext? context) {
    final String? traceId = Zone.current[#traceId] as String?;

    final logMap = {
      'timestamp': DateTime.timestamp().toIso8601String(),
      'event': context?.event ?? 'undefined_event',
      'traceId': traceId ?? 'internal',
      'message': message,
      if (context?.payload != null) 'payload': _sanitizer.sanitize(context!.payload!),
    };

    return jsonEncode(logMap);
  }
}
