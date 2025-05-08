// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
  json['_id'] as String,
  json['birthdate'] as String,
  json['fullname'] as String,
  (json['height'] as num).toInt(),
  (json['weight'] as num).toInt(),
);

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
  '_id': instance.profileId,
  'birthdate': instance.birthdate,
  'fullname': instance.fullname,
  'height': instance.height,
  'weight': instance.weight,
};
