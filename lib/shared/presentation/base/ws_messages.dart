import 'package:epp_backend/shared/presentation/base/presentation_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ws_messages.freezed.dart';

part 'ws_messages.g.dart';

@freezed
abstract class WsTopic with _$WsTopic {
  const factory WsTopic({
    required String title,
    String? id,
  }) = _WsTopic;

  factory WsTopic.fromJson(Map<String, dynamic> json) => _$WsTopicFromJson(json);

  const WsTopic._();

  String get fullName => '$title:$id';
}

enum WsClientAction { subscribe, unsubscribe }

@freezed
abstract class WsClientMessage with _$WsClientMessage {
  const factory WsClientMessage({required WsClientAction action, required WsTopic topic}) = _WsClientMessage;

  factory WsClientMessage.fromJson(Map<String, dynamic> json) => _$WsClientMessageFromJson(json);
}

enum WsServerMessageType { error, event }

@freezed
abstract class WsServerMessage with _$WsServerMessage {
  const factory WsServerMessage({
    /// Event or error title
    required String title,
    required WsTopic topic,
    required WsServerMessageType type,
    Map<String, dynamic>? payload,
  }) = _WsServerMessage;

  factory WsServerMessage.event({
    required WsTopic topic,
    required String title,
    Map<String, dynamic>? payload,
  }) => WsServerMessage(
    title: title,
    topic: topic,
    type: WsServerMessageType.event,
    payload: payload,
  );

  factory WsServerMessage.error({
    required WsTopic topic,
    required PresentationError error,
  }) => WsServerMessage(
    title: error.code,
    topic: topic,
    type: WsServerMessageType.error,
    payload: error.toJson(),
  );

  factory WsServerMessage.fromJson(Map<String, dynamic> json) => _$WsServerMessageFromJson(json);
}
