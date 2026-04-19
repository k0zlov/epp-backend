// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_session_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefreshSessionParams _$RefreshSessionParamsFromJson(
  Map<String, dynamic> json,
) => _RefreshSessionParams(
  userId: json['userId'] as String,
  sessionId: json['sessionId'] as String,
  token: json['token'] as String,
  ipAddress: json['ipAddress'] as String,
  userAgent: json['userAgent'] as String,
);

Map<String, dynamic> _$RefreshSessionParamsToJson(
  _RefreshSessionParams instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'sessionId': instance.sessionId,
  'token': instance.token,
  'ipAddress': instance.ipAddress,
  'userAgent': instance.userAgent,
};
