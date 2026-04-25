// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogContext _$LogContextFromJson(Map<String, dynamic> json) => _LogContext(
  event: json['event'] as String,
  payload: json['payload'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$LogContextToJson(_LogContext instance) =>
    <String, dynamic>{'event': instance.event, 'payload': instance.payload};
