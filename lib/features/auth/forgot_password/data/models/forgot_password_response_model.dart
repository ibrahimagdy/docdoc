import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_response_model.g.dart';

@JsonSerializable()
class ForgotPasswordResponseModel {
  final bool success;
  @JsonKey(name: 'messsage')
  final String? message;
  final String data;
  final dynamic errors;
  final int statusCode;

  ForgotPasswordResponseModel({
    required this.success,
    this.message,
    required this.data,
    required this.errors,
    required this.statusCode,
  });

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseModelToJson(this);
}