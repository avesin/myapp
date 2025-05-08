import 'package:json_annotation/json_annotation.dart';

part 'token_payload.g.dart';

@JsonSerializable()
class TokenPayload {
  final String refresh_token;

  TokenPayload(this.refresh_token);

  factory TokenPayload.fromJson(Map<String, dynamic> json) =>
      _$TokenPayloadFromJson(json);
  Map<String, dynamic> toJson() => _$TokenPayloadToJson(this);
}
