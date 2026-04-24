import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ruta/ruta.dart';

part 'presentation_error.g.dart';

part 'presentation_error.freezed.dart';

@freezed
abstract class PresentationError with _$PresentationError {
  const factory PresentationError({
    required int statusCode,
    required String code,
    required String message,
    Map<String, dynamic>? details,
  }) = _PresentationError;

  factory PresentationError.fromJson(Map<String, dynamic> json) => _$PresentationErrorFromJson(json);

  const PresentationError._();

  Response toResponse() {
    return Response.json(statusCode: statusCode, body: toJson());
  }
}
