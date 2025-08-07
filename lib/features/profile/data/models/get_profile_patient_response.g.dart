// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_patient_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfilePatientResponse _$GetProfilePatientResponseFromJson(
        Map<String, dynamic> json) =>
    GetProfilePatientResponse(
      success: json['success'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['messsage'] as String,
      userData: UserData.fromJson(json['data'] as Map<String, dynamic>),
      errors: json['errors'] as String?,
    );

Map<String, dynamic> _$GetProfilePatientResponseToJson(
        GetProfilePatientResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'messsage': instance.message,
      'data': instance.userData,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      profileImage: json['profileImage'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'profileImage': instance.profileImage,
      'fullName': instance.fullName,
      'email': instance.email,
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
    };
