// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WsTopic _$WsTopicFromJson(Map<String, dynamic> json) =>
    _WsTopic(title: json['title'] as String, id: json['id'] as String?);

Map<String, dynamic> _$WsTopicToJson(_WsTopic instance) => <String, dynamic>{
  'title': instance.title,
  'id': instance.id,
};

_WsClientMessage _$WsClientMessageFromJson(Map<String, dynamic> json) =>
    _WsClientMessage(
      action: $enumDecode(_$WsClientActionEnumMap, json['action']),
      topic: WsTopic.fromJson(json['topic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WsClientMessageToJson(_WsClientMessage instance) =>
    <String, dynamic>{
      'action': _$WsClientActionEnumMap[instance.action]!,
      'topic': instance.topic,
    };

const _$WsClientActionEnumMap = {
  WsClientAction.subscribe: 'subscribe',
  WsClientAction.unsubscribe: 'unsubscribe',
};

_WsServerMessage _$WsServerMessageFromJson(Map<String, dynamic> json) =>
    _WsServerMessage(
      title: json['title'] as String,
      topic: WsTopic.fromJson(json['topic'] as Map<String, dynamic>),
      type: $enumDecode(_$WsServerMessageTypeEnumMap, json['type']),
      payload: json['payload'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$WsServerMessageToJson(_WsServerMessage instance) =>
    <String, dynamic>{
      'title': instance.title,
      'topic': instance.topic,
      'type': _$WsServerMessageTypeEnumMap[instance.type]!,
      'payload': instance.payload,
    };

const _$WsServerMessageTypeEnumMap = {
  WsServerMessageType.error: 'error',
  WsServerMessageType.event: 'event',
};
