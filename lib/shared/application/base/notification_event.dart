import 'package:freezed_annotation/freezed_annotation.dart';

enum NotificationEvent {
  @JsonValue('auth:logout')
  authLogout,
  @JsonValue('auth:token_refreshed')
  authTokenRefreshed,
  @JsonValue('auth:session_updated')
  authSessionUpdated,
  @JsonValue('sync:updated')
  syncUpdated,
  @JsonValue('sync:created')
  syncCreated,
  @JsonValue('sync:deleted')
  syncDeleted,
  @JsonValue('system:error')
  systemError,
}
