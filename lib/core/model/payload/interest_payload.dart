import 'package:json_annotation/json_annotation.dart';

part 'interest_payload.g.dart';

@JsonSerializable()
class InterestPayload {
  final List<String> values;

  InterestPayload(this.values);

    factory InterestPayload.fromJson(Map<String, dynamic> json) =>
      _$InterestPayloadFromJson(json);
  Map<String, dynamic> toJson() => _$InterestPayloadToJson(this);
}