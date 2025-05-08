import 'package:json_annotation/json_annotation.dart';

part 'interest_response.g.dart';

@JsonSerializable()
class InterestResponse {
  final List<String> values;

  InterestResponse(this.values);

    factory InterestResponse.fromJson(Map<String, dynamic> json) =>
      _$InterestResponseFromJson(json);
  Map<String, dynamic> toJson() => _$InterestResponseToJson(this);
}