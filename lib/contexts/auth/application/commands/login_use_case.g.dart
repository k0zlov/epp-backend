// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginParams _$LoginParamsFromJson(Map<String, dynamic> json) => _LoginParams(
  email: json['email'] as String,
  password: json['password'] as String,
  ipAddress: json['ipAddress'] as String,
  userAgent: json['userAgent'] as String,
);

Map<String, dynamic> _$LoginParamsToJson(_LoginParams instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'ipAddress': instance.ipAddress,
      'userAgent': instance.userAgent,
    };
