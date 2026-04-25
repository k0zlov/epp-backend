import 'package:epp_backend/shared/application/base/notification_event.dart';
import 'package:epp_backend/shared/application/base/notification_scope.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_message.freezed.dart';

part 'notification_message.g.dart';

@freezed
abstract class NotificationTopic with _$NotificationTopic {
  const factory NotificationTopic({
    required NotificationScope scope,
    String? id,
  }) = _NotificationTopic;

  factory NotificationTopic.fromJson(Map<String, dynamic> json) => _$NotificationTopicFromJson(json);
}

enum NotificationMessageType { error, event }

@freezed
abstract class NotificationMessage with _$NotificationMessage {
  const factory NotificationMessage({
    required NotificationEvent title,
    required NotificationTopic topic,
    required NotificationMessageType type,
    Map<String, dynamic>? payload,
  }) = _NotificationMessage;

  factory NotificationMessage.event({
    required NotificationEvent title,
    required NotificationTopic topic,
    Map<String, dynamic>? payload,
  }) => NotificationMessage(
    title: title,
    topic: topic,
    type: NotificationMessageType.event,
    payload: payload,
  );

  factory NotificationMessage.error({
    required String message,
    NotificationTopic topic = const NotificationTopic(scope: NotificationScope.system),
    NotificationEvent title = NotificationEvent.systemError,
    Map<String, dynamic>? details,
  }) => NotificationMessage(
    title: title,
    topic: topic,
    type: NotificationMessageType.error,
    payload: {'message': message, if (details != null) ...details},
  );

  factory NotificationMessage.fromJson(Map<String, dynamic> json) => _$NotificationMessageFromJson(json);
}
