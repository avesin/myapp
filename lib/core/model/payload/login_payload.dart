import 'package:json_annotation/json_annotation.dart';

part 'login_payload.g.dart';

@JsonSerializable()
class LoginPayload {
  final String? email;
  final String? username;
  final String password;

  LoginPayload(this.password, {this.email, this.username});

  factory LoginPayload.fromJson(Map<String, dynamic> json) =>
      _$LoginPayloadFromJson(json);
  Map<String, dynamic> toJson() => _$LoginPayloadToJson(this);
}