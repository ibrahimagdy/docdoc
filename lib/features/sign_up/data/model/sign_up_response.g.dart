// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      success: json['success'] as bool,
      message: json['messsage'] as String,
      userData: UserData.fromJson(json['data'] as Map<String, dynamic>),
      errors: json['errors'] as String?,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'messsage': instance.message,
      'data': instance.userData,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'userName': instance.userName,
      'token': instance.token,
    };
