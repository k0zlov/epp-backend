// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_integration_events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSignedUpIntegrationEvent _$UserSignedUpIntegrationEventFromJson(
  Map<String, dynamic> json,
) => _UserSignedUpIntegrationEvent(
  userId: json['userId'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$UserSignedUpIntegrationEventToJson(
  _UserSignedUpIntegrationEvent instance,
) => <String, dynamic>{'userId': instance.userId, 'email': instance.email};

_UserLoggedInIntegrationEvent _$UserLoggedInIntegrationEventFromJson(
  Map<String, dynamic> json,
) => _UserLoggedInIntegrationEvent(
  userId: json['userId'] as String,
  sessionId: json['sessionId'] as String,
  ipAddress: json['ipAddress'] as String,
  userAgent: json['userAgent'] as String,
);

Map<String, dynamic> _$UserLoggedInIntegrationEventToJson(
  _UserLoggedInIntegrationEvent instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'sessionId': instance.sessionId,
  'ipAddress': instance.ipAddress,
  'userAgent': instance.userAgent,
};

_EmailConfirmedIntegrationEvent _$EmailConfirmedIntegrationEventFromJson(
  Map<String, dynamic> json,
) => _EmailConfirmedIntegrationEvent(
  userId: json['userId'] as String,
  codeId: json['codeId'] as String,
);

Map<String, dynamic> _$EmailConfirmedIntegrationEventToJson(
  _EmailConfirmedIntegrationEvent instance,
) => <String, dynamic>{'userId': instance.userId, 'codeId': instance.codeId};

_EmailConfirmationFailedIntegrationEvent
_$EmailConfirmationFailedIntegrationEventFromJson(Map<String, dynamic> json) =>
    _EmailConfirmationFailedIntegrationEvent(
      userId: json['userId'] as String,
      codeId: json['codeId'] as String,
      attempts: (json['attempts'] as num).toInt(),
    );

Map<String, dynamic> _$EmailConfirmationFailedIntegrationEventToJson(
  _EmailConfirmationFailedIntegrationEvent instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'codeId': instance.codeId,
  'attempts': instance.attempts,
};

_AuthCodeCreatedIntegrationEvent _$AuthCodeCreatedIntegrationEventFromJson(
  Map<String, dynamic> json,
) => _AuthCodeCreatedIntegrationEvent(
  userId: json['userId'] as String,
  codeId: json['codeId'] as String,
  type: json['type'] as String,
  invalidatedCodeIds: (json['invalidatedCodeIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$AuthCodeCreatedIntegrationEventToJson(
  _AuthCodeCreatedIntegrationEvent instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'codeId': instance.codeId,
  'type': instance.type,
  'invalidatedCodeIds': instance.invalidatedCodeIds,
};

_AuthSessionRefreshedIntegrationEvent
_$AuthSessionRefreshedIntegrationEventFromJson(Map<String, dynamic> json) =>
    _AuthSessionRefreshedIntegrationEvent(
      userId: json['userId'] as String,
      sessionId: json['sessionId'] as String,
      ipAddress: json['ipAddress'] as String,
    );

Map<String, dynamic> _$AuthSessionRefreshedIntegrationEventToJson(
  _AuthSessionRefreshedIntegrationEvent instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'sessionId': instance.sessionId,
  'ipAddress': instance.ipAddress,
};

_AuthTokenReuseDetectedIntegrationEvent
_$AuthTokenReuseDetectedIntegrationEventFromJson(Map<String, dynamic> json) =>
    _AuthTokenReuseDetectedIntegrationEvent(
      userId: json['userId'] as String,
      sessionId: json['sessionId'] as String,
    );

Map<String, dynamic> _$AuthTokenReuseDetectedIntegrationEventToJson(
  _AuthTokenReuseDetectedIntegrationEvent instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'sessionId': instance.sessionId,
};

_UserLoggedOutIntegrationEvent _$UserLoggedOutIntegrationEventFromJson(
  Map<String, dynamic> json,
) => _UserLoggedOutIntegrationEvent(
  userId: json['userId'] as String,
  sessionId: json['sessionId'] as String,
);

Map<String, dynamic> _$UserLoggedOutIntegrationEventToJson(
  _UserLoggedOutIntegrationEvent instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'sessionId': instance.sessionId,
};

_UserPasswordResetIntegrationEvent _$UserPasswordResetIntegrationEventFromJson(
  Map<String, dynamic> json,
) => _UserPasswordResetIntegrationEvent(
  userId: json['userId'] as String,
  codeId: json['codeId'] as String,
  terminatedSessionIds: (json['terminatedSessionIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$UserPasswordResetIntegrationEventToJson(
  _UserPasswordResetIntegrationEvent instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'codeId': instance.codeId,
  'terminatedSessionIds': instance.terminatedSessionIds,
};

_PasswordResetFailedIntegrationEvent
_$PasswordResetFailedIntegrationEventFromJson(Map<String, dynamic> json) =>
    _PasswordResetFailedIntegrationEvent(
      userId: json['userId'] as String,
      codeId: json['codeId'] as String,
      attempts: (json['attempts'] as num).toInt(),
    );

Map<String, dynamic> _$PasswordResetFailedIntegrationEventToJson(
  _PasswordResetFailedIntegrationEvent instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'codeId': instance.codeId,
  'attempts': instance.attempts,
};
