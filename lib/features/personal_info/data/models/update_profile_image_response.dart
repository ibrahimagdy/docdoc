import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_image_response.g.dart';

@JsonSerializable()
class AddProfileImageResponse {
  final bool success;
  @JsonKey(name: 'messsage')
  final String message;
  final String? data;
  final String? errors;
  final int statusCode;

  AddProfileImageResponse({
    required this.success,
    required this.message,
    this.data,
    this.errors,
    required this.statusCode,
  });

  factory AddProfileImageResponse.fromJson(Map<String, dynamic> json) =>
      _$AddProfileImageResponseFromJson(json);
}

