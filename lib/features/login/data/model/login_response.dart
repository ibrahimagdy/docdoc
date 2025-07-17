import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool success;
  @JsonKey(name: 'messsage')
  final String message;
  @JsonKey(name: 'data')
  final UserData userData;
  final String? errors;
  final int statusCode;

  LoginResponse({
    required this.success,
    required this.message,
    required this.userData,
    this.errors,
    required this.statusCode,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final String fullName;
  final String email;
  final String userName;
  final String token;

  UserData({
    required this.fullName,
    required this.email,
    required this.userName,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
