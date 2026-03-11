// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorDetailsResponse _$DoctorDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    DoctorDetailsResponse(
      success: json['success'] as bool,
      message: json['messsage'] as String,
      doctorDetails: json['data'] == null
          ? null
          : DoctorDetailsData.fromJson(json['data'] as Map<String, dynamic>),
      errors: json['errors'] as String?,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$DoctorDetailsResponseToJson(
        DoctorDetailsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'messsage': instance.message,
      'data': instance.doctorDetails,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
    };

DoctorDetailsData _$DoctorDetailsDataFromJson(Map<String, dynamic> json) =>
    DoctorDetailsData(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      profileImage:
          DoctorDetailsData._fixImageUrl(json['profileImageUrl'] as String),
      specializationName: json['specializationName'] as String,
      workingTime: json['workingTime'] as String,
      aboutMe: json['aboutMe'] as String,
      address: json['address'] as String,
      yearsOfExperience: (json['yearsOfExperience'] as num).toInt(),
      degree: json['degree'] as String,
      rate: (json['rate'] as num).toDouble(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$DoctorDetailsDataToJson(DoctorDetailsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'profileImageUrl': instance.profileImage,
      'specializationName': instance.specializationName,
      'workingTime': instance.workingTime,
      'aboutMe': instance.aboutMe,
      'address': instance.address,
      'yearsOfExperience': instance.yearsOfExperience,
      'degree': instance.degree,
      'rate': instance.rate,
      'reviewsCount': instance.reviewsCount,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
