import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String fullName;
  final String userName;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;

  SignUpRequestBody({
    required this.fullName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
