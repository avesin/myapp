import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: '_id')
  final String profileId;
  final String birthdate;
  final String fullname;
  final int height;
  final int weight;

  Profile(this.profileId, this.birthdate, this.fullname, this.height, this.weight);

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
