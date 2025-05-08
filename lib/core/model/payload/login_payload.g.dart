// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginPayload _$LoginPayloadFromJson(Map<String, dynamic> json) => LoginPayload(
  json['password'] as String,
  email: json['email'] as String?,
  username: json['username'] as String?,
);

Map<String, dynamic> _$LoginPayloadToJson(LoginPayload instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
    };
