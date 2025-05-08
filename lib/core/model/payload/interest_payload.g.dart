// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interest_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterestPayload _$InterestPayloadFromJson(Map<String, dynamic> json) =>
    InterestPayload(
      (json['values'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$InterestPayloadToJson(InterestPayload instance) =>
    <String, dynamic>{'values': instance.values};
