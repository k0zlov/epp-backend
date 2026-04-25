// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientInfo _$ClientInfoFromJson(Map<String, dynamic> json) => _ClientInfo(
  clientId: json['clientId'] as String,
  userId: json['userId'] as String?,
  sessionId: json['sessionId'] as String?,
);

Map<String, dynamic> _$ClientInfoToJson(_ClientInfo instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'userId': instance.userId,
      'sessionId': instance.sessionId,
    };
