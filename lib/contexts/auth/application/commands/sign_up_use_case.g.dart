// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignUpParams _$SignUpParamsFromJson(Map<String, dynamic> json) =>
    _SignUpParams(
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignUpParamsToJson(_SignUpParams instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'password': instance.password,
    };
