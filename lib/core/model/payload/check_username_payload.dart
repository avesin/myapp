import 'package:json_annotation/json_annotation.dart';

part 'check_username_payload.g.dart';

@JsonSerializable()
class CheckUsernamePayload {
  final String username;

  CheckUsernamePayload({required this.username});

  factory CheckUsernamePayload.fromJson(Map<String, dynamic> json) =>
      _$CheckUsernamePayloadFromJson(json);
  Map<String, dynamic> toJson() => _$CheckUsernamePayloadToJson(this);
}