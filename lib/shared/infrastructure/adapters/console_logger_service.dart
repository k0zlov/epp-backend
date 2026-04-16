import 'package:epp_backend/shared/application/ports/logger_service.dart';
import 'package:logger/logger.dart';

class ConsoleLoggerService implements LoggerService {
  ConsoleLoggerService({bool silent = false})
    : _logger = Logger(
        level: silent ? Level.off : Level.all,
        filter: ProductionFilter(),
        printer: PrettyPrinter(
          errorMethodCount: 30,
          dateTimeFormat: DateTimeFormat.dateAndTime,
        ),
      );

  final Logger _logger;

  @override
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  @override
  void info(String message) {
    _logger.i(message);
  }

  @override
  void warning(String message) {
    _logger.w(message);
  }
}
