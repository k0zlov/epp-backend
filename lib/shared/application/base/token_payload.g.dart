// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenPayload _$TokenPayloadFromJson(Map<String, dynamic> json) =>
    _TokenPayload(
      userId: json['userId'] as String,
      sessionId: json['sessionId'] as String,
    );

Map<String, dynamic> _$TokenPayloadToJson(_TokenPayload instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'sessionId': instance.sessionId,
    };
