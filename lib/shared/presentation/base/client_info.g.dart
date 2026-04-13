// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientInfo _$ClientInfoFromJson(Map<String, dynamic> json) => _ClientInfo(
  clientId: json['clientId'] as String,
  isAuthorized: json['isAuthorized'] as bool,
);

Map<String, dynamic> _$ClientInfoToJson(_ClientInfo instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'isAuthorized': instance.isAuthorized,
    };
