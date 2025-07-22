import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_response_model.g.dart';

@JsonSerializable()
class VerifyOtpResponseModel {
  final bool success;
  @JsonKey(name: 'messsage')
  final String message;
  @JsonKey(name: 'data')
  final UserData userData;
  final dynamic errors;
  final int statusCode;

  VerifyOtpResponseModel({
    required this.success,
    required this.message,
    required this.userData,
    required this.errors,
    required this.statusCode,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpResponseModelToJson(this);
}

@JsonSerializable()
class UserData {
  final bool isValid;
  final String message;

  UserData({
    required this.isValid,
    required this.message,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}