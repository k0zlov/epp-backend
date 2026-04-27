import 'package:logger/logger.dart';

class JsonLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return [event.message.toString()];
  }
}
