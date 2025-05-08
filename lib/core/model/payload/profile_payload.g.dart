// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilePayload _$ProfilePayloadFromJson(Map<String, dynamic> json) =>
    ProfilePayload(
      json['fullname'] as String?,
      json['gender'] as String?,
      json['birthdate'] == null
          ? null
          : DateTime.parse(json['birthdate'] as String),
      (json['height'] as num?)?.toInt(),
      (json['weight'] as num?)?.toInt(),
      json['image'] as String?,
    );

Map<String, dynamic> _$ProfilePayloadToJson(ProfilePayload instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'gender': instance.gender,
      'birthdate': instance.birthdate?.toIso8601String(),
      'height': instance.height,
      'weight': instance.weight,
      'image': instance.image,
    };
