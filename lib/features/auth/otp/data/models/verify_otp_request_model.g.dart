// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpRequestModel _$VerifyOtpRequestModelFromJson(
        Map<String, dynamic> json) =>
    VerifyOtpRequestModel(
      email: json['email'] as String,
      otpCode: json['otpCode'] as String,
    );

Map<String, dynamic> _$VerifyOtpRequestModelToJson(
        VerifyOtpRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otpCode': instance.otpCode,
    };
