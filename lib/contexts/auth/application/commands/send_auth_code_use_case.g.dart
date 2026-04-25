// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_auth_code_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SendAuthCodeParams _$SendAuthCodeParamsFromJson(Map<String, dynamic> json) =>
    _SendAuthCodeParams(
      email: json['email'] as String,
      type: $enumDecode(_$AuthCodeTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$SendAuthCodeParamsToJson(_SendAuthCodeParams instance) =>
    <String, dynamic>{
      'email': instance.email,
      'type': _$AuthCodeTypeEnumMap[instance.type]!,
    };

const _$AuthCodeTypeEnumMap = {
  AuthCodeType.emailVerification: 'emailVerification',
  AuthCodeType.passwordReset: 'passwordReset',
};
