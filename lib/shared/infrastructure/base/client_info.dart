import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_info.g.dart';

part 'client_info.freezed.dart';

@freezed
abstract class ClientInfo with _$ClientInfo {
  const factory ClientInfo({
    required String clientId,
    required String? userId,
    required String? sessionId,
  }) = _ClientInfo;

  const ClientInfo._();

  factory ClientInfo.fromJson(Map<String, dynamic> json) => _$ClientInfoFromJson(json);

  bool get isAuthorized => userId != null && sessionId != null;
}
