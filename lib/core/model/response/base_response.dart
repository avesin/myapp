import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final bool status;
  final int code;
  final String message;
  final T? data;
  final String? path;
  final String? timestamp;

  BaseResponse(this.status, this.code, this.message, {this.data, this.path, this.timestamp});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}