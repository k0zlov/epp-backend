// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_password_reset_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConfirmPasswordResetParams _$ConfirmPasswordResetParamsFromJson(
  Map<String, dynamic> json,
) => _ConfirmPasswordResetParams(
  email: json['email'] as String,
  newPassword: json['newPassword'] as String,
  code: json['code'] as String,
);

Map<String, dynamic> _$ConfirmPasswordResetParamsToJson(
  _ConfirmPasswordResetParams instance,
) => <String, dynamic>{
  'email': instance.email,
  'newPassword': instance.newPassword,
  'code': instance.code,
};
