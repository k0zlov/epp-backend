// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationTopic _$NotificationTopicFromJson(Map<String, dynamic> json) =>
    _NotificationTopic(
      scope: $enumDecode(_$NotificationScopeEnumMap, json['scope']),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$NotificationTopicToJson(_NotificationTopic instance) =>
    <String, dynamic>{
      'scope': _$NotificationScopeEnumMap[instance.scope]!,
      'id': instance.id,
    };

const _$NotificationScopeEnumMap = {
  NotificationScope.user: 'user',
  NotificationScope.session: 'session',
  NotificationScope.system: 'system',
};

_NotificationMessage _$NotificationMessageFromJson(Map<String, dynamic> json) =>
    _NotificationMessage(
      title: $enumDecode(_$NotificationEventEnumMap, json['title']),
      topic: NotificationTopic.fromJson(json['topic'] as Map<String, dynamic>),
      type: $enumDecode(_$NotificationMessageTypeEnumMap, json['type']),
      payload: json['payload'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$NotificationMessageToJson(
  _NotificationMessage instance,
) => <String, dynamic>{
  'title': _$NotificationEventEnumMap[instance.title]!,
  'topic': instance.topic,
  'type': _$NotificationMessageTypeEnumMap[instance.type]!,
  'payload': instance.payload,
};

const _$NotificationEventEnumMap = {
  NotificationEvent.authLogout: 'auth:logout',
  NotificationEvent.authTokenRefreshed: 'auth:token_refreshed',
  NotificationEvent.authSessionUpdated: 'auth:session_updated',
  NotificationEvent.syncUpdated: 'sync:updated',
  NotificationEvent.syncCreated: 'sync:created',
  NotificationEvent.syncDeleted: 'sync:deleted',
  NotificationEvent.systemError: 'system:error',
};

const _$NotificationMessageTypeEnumMap = {
  NotificationMessageType.error: 'error',
  NotificationMessageType.event: 'event',
};
