import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_request.g.dart';

@JsonSerializable()
class UpdateProfileRequest {
  final String fullName;
  final String email;
  final String phoneNumber;

  UpdateProfileRequest({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}