// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpResponseModel _$VerifyOtpResponseModelFromJson(
        Map<String, dynamic> json) =>
    VerifyOtpResponseModel(
      success: json['success'] as bool,
      message: json['messsage'] as String,
      userData: UserData.fromJson(json['data'] as Map<String, dynamic>),
      errors: json['errors'],
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$VerifyOtpResponseModelToJson(
        VerifyOtpResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'messsage': instance.message,
      'data': instance.userData,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      isValid: json['isValid'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'isValid': instance.isValid,
      'message': instance.message,
    };
