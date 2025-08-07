import 'package:json_annotation/json_annotation.dart';

part 'get_profile_patient_response.g.dart';

@JsonSerializable()
class GetProfilePatientResponse {
  final bool success;
  @JsonKey(name: 'messsage')
  final String message;
  @JsonKey(name: 'data')
  final UserData userData;
  final String? errors;
  final int statusCode;


  GetProfilePatientResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.userData,
    this.errors,
  });

  factory GetProfilePatientResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfilePatientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProfilePatientResponseToJson(this);
}

@JsonSerializable()
class UserData {
  final String profileImage;
  final String fullName;
  final String email;
  final String userName;
  final String phoneNumber;

  UserData({
    required this.profileImage,
    required this.fullName,
    required this.email,
    required this.userName,
    required this.phoneNumber,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
