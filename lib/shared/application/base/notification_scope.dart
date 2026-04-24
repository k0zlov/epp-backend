import 'package:freezed_annotation/freezed_annotation.dart';

enum NotificationScope {
  @JsonValue('user')
  user,
  @JsonValue('session')
  session,
  @JsonValue('system')
  system,
}
