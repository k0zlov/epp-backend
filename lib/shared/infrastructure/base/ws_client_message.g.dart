// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_client_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WsClientMessage _$WsClientMessageFromJson(Map<String, dynamic> json) =>
    _WsClientMessage(
      action: json['action'] as String,
      topic: NotificationTopic.fromJson(json['topic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WsClientMessageToJson(_WsClientMessage instance) =>
    <String, dynamic>{'action': instance.action, 'topic': instance.topic};
