import 'package:json_annotation/json_annotation.dart';

part 'register_payload.g.dart';

@JsonSerializable()
class RegisterPayload {
  final String email;
  final String username;
  final String password;

  RegisterPayload({required this.username, required this.email, required this.password});

  factory RegisterPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterPayloadFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterPayloadToJson(this);
}