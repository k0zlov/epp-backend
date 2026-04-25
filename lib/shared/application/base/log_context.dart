import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_context.freezed.dart';

part 'log_context.g.dart';

@freezed
abstract class LogContext with _$LogContext {
  const factory LogContext({required String event, Map<String, dynamic>? payload}) = _LogContext;

  factory LogContext.fromJson(Map<String, dynamic> json) => _$LogContextFromJson(json);
}
