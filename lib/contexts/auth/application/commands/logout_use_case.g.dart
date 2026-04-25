// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogoutParams _$LogoutParamsFromJson(Map<String, dynamic> json) =>
    _LogoutParams(
      userId: json['userId'] as String,
      sessionId: json['sessionId'] as String,
    );

Map<String, dynamic> _$LogoutParamsToJson(_LogoutParams instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'sessionId': instance.sessionId,
    };
