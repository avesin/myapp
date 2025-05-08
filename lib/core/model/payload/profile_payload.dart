import 'package:json_annotation/json_annotation.dart';

part 'profile_payload.g.dart';

@JsonSerializable()
class ProfilePayload {
  final String? fullname;
  final String? gender;
  final DateTime? birthdate;
  final int? height;
  final int? weight;
  final String? image;  

  ProfilePayload(
    this.fullname,
    this.gender,
    this.birthdate,
    this.height,
    this.weight,
    this.image
  );

  factory ProfilePayload.fromJson(Map<String, dynamic> json) =>
      _$ProfilePayloadFromJson(json);
  Map<String, dynamic> toJson() => _$ProfilePayloadToJson(this);
}
