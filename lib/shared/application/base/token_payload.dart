import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_payload.freezed.dart';

part 'token_payload.g.dart';

@freezed
abstract class TokenPayload with _$TokenPayload {
  const factory TokenPayload({required String userId, required String sessionId}) = _TokenPayload;

  factory TokenPayload.fromJson(Map<String, dynamic> json) => _$TokenPayloadFromJson(json);
}
