// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_session_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefreshSessionParams _$RefreshSessionParamsFromJson(
  Map<String, dynamic> json,
) => _RefreshSessionParams(
  refreshToken: json['refreshToken'] as String,
  ipAddress: json['ipAddress'] as String,
  userAgent: json['userAgent'] as String,
);

Map<String, dynamic> _$RefreshSessionParamsToJson(
  _RefreshSessionParams instance,
) => <String, dynamic>{
  'refreshToken': instance.refreshToken,
  'ipAddress': instance.ipAddress,
  'userAgent': instance.userAgent,
};
