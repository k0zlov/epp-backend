import 'package:epp_backend/shared/application/base/integration_event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_integration_events.g.dart';

part 'auth_integration_events.freezed.dart';

@freezed
abstract class UserSignedUpIntegrationEvent extends IntegrationEvent with _$UserSignedUpIntegrationEvent {
  factory UserSignedUpIntegrationEvent({
    required String userId,
    required String email,
  }) = _UserSignedUpIntegrationEvent;

  UserSignedUpIntegrationEvent._();

  factory UserSignedUpIntegrationEvent.fromJson(Map<String, dynamic> json) =>
      _$UserSignedUpIntegrationEventFromJson(json);
}

@freezed
abstract class UserLoggedInIntegrationEvent extends IntegrationEvent with _$UserLoggedInIntegrationEvent {
  factory UserLoggedInIntegrationEvent({
    required String userId,
    required String sessionId,
    required String ipAddress,
    required String userAgent,
  }) = _UserLoggedInIntegrationEvent;

  UserLoggedInIntegrationEvent._();

  factory UserLoggedInIntegrationEvent.fromJson(Map<String, dynamic> json) =>
      _$UserLoggedInIntegrationEventFromJson(json);
}

@freezed
abstract class EmailConfirmedIntegrationEvent extends IntegrationEvent with _$EmailConfirmedIntegrationEvent {
  factory EmailConfirmedIntegrationEvent({
    required String userId,
    required String codeId,
  }) = _EmailConfirmedIntegrationEvent;

  EmailConfirmedIntegrationEvent._();

  factory EmailConfirmedIntegrationEvent.fromJson(Map<String, dynamic> json) =>
      _$EmailConfirmedIntegrationEventFromJson(json);
}

@freezed
abstract class EmailConfirmationFailedIntegrationEvent extends IntegrationEvent
    with _$EmailConfirmationFailedIntegrationEvent {
  factory EmailConfirmationFailedIntegrationEvent({
    required String userId,
    required String codeId,
    required int attempts,
  }) = _EmailConfirmationFailedIntegrationEvent;

  EmailConfirmationFailedIntegrationEvent._();

  factory EmailConfirmationFailedIntegrationEvent.fromJson(Map<String, dynamic> json) =>
      _$EmailConfirmationFailedIntegrationEventFromJson(json);
}

@freezed
abstract class AuthCodeCreatedIntegrationEvent extends IntegrationEvent with _$AuthCodeCreatedIntegrationEvent {
  factory AuthCodeCreatedIntegrationEvent({
    required String userId,
    required String codeId,
    required String type,
    required List<String> invalidatedCodeIds,
  }) = _AuthCodeCreatedIntegrationEvent;

  AuthCodeCreatedIntegrationEvent._();

  factory AuthCodeCreatedIntegrationEvent.fromJson(Map<String, dynamic> json) =>
      _$AuthCodeCreatedIntegrationEventFromJson(json);
}

@freezed
abstract class AuthSessionRefreshedIntegrationEvent extends IntegrationEvent
    with _$AuthSessionRefreshedIntegrationEvent {
  factory AuthSessionRefreshedIntegrationEvent({
    required String userId,
    required String sessionId,
    required String ipAddress,
    required String accessToken,
    required String refreshToken,
  }) = _AuthSessionRefreshedIntegrationEvent;

  AuthSessionRefreshedIntegrationEvent._();

  factory AuthSessionRefreshedIntegrationEvent.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionRefreshedIntegrationEventFromJson(json);
}

@freezed
abstract class AuthTokenReuseDetectedIntegrationEvent extends IntegrationEvent
    with _$AuthTokenReuseDetectedIntegrationEvent {
  factory AuthTokenReuseDetectedIntegrationEvent({
    required String userId,
    required String sessionId,
  }) = _AuthTokenReuseDetectedIntegrationEvent;

  AuthTokenReuseDetectedIntegrationEvent._();

  factory AuthTokenReuseDetectedIntegrationEvent.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenReuseDetectedIntegrationEventFromJson(json);
}

@freezed
abstract class UserLoggedOutIntegrationEvent extends IntegrationEvent with _$UserLoggedOutIntegrationEvent {
  factory UserLoggedOutIntegrationEvent({
    required String userId,
    required String sessionId,
  }) = _UserLoggedOutIntegrationEvent;

  UserLoggedOutIntegrationEvent._();

  factory UserLoggedOutIntegrationEvent.fromJson(Map<String, dynamic> json) =>
      _$UserLoggedOutIntegrationEventFromJson(json);
}

@freezed
abstract class UserPasswordResetIntegrationEvent extends IntegrationEvent with _$UserPasswordResetIntegrationEvent {
  factory UserPasswordResetIntegrationEvent({
    required String userId,
    required String codeId,
    required List<String> terminatedSessionIds,
  }) = _UserPasswordResetIntegrationEvent;

  UserPasswordResetIntegrationEvent._();

  factory UserPasswordResetIntegrationEvent.fromJson(Map<String, dynamic> json) =>
      _$UserPasswordResetIntegrationEventFromJson(json);
}

@freezed
abstract class PasswordResetFailedIntegrationEvent extends IntegrationEvent with _$PasswordResetFailedIntegrationEvent {
  factory PasswordResetFailedIntegrationEvent({
    required String userId,
    required String codeId,
    required int attempts,
  }) = _PasswordResetFailedIntegrationEvent;

  PasswordResetFailedIntegrationEvent._();

  factory PasswordResetFailedIntegrationEvent.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetFailedIntegrationEventFromJson(json);
}
