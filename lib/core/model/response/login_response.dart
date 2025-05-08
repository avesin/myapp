import 'package:json_annotation/json_annotation.dart';
import 'package:myapp/core/model/data/user.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String access_token;
  final String refresh_token;
  final User? user;

  LoginResponse(this.access_token, this.refresh_token, this.user);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}