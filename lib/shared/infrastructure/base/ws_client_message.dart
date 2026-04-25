import 'package:epp_backend/shared/application/base/notification_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ws_client_message.freezed.dart';

part 'ws_client_message.g.dart';

@freezed
abstract class WsClientMessage with _$WsClientMessage {
  const factory WsClientMessage({
    required String action,
    required NotificationTopic topic,
  }) = _WsClientMessage;

  factory WsClientMessage.fromJson(Map<String, dynamic> json) => _$WsClientMessageFromJson(json);
}
