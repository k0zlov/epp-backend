// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presentation_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PresentationError _$PresentationErrorFromJson(Map<String, dynamic> json) =>
    _PresentationError(
      statusCode: (json['statusCode'] as num).toInt(),
      code: json['code'] as String,
      message: json['message'] as String,
      details: json['details'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PresentationErrorToJson(_PresentationError instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'code': instance.code,
      'message': instance.message,
      'details': instance.details,
    };
