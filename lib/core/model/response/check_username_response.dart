import 'package:json_annotation/json_annotation.dart';

part 'check_username_response.g.dart';

@JsonSerializable()
class CheckUsernameResponse {
  final bool isUsenameUsed;

  CheckUsernameResponse(this.isUsenameUsed);

  factory CheckUsernameResponse.fromJson(Map<String, dynamic> json) => _$CheckUsernameResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CheckUsernameResponseToJson(this);
}