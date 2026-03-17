// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_doctors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendationDoctorsResponse _$RecommendationDoctorsResponseFromJson(
        Map<String, dynamic> json) =>
    RecommendationDoctorsResponse(
      success: json['success'] as bool,
      message: json['messsage'] as String,
      doctorsData: json['data'] == null
          ? null
          : DoctorsPaginationData.fromJson(
              json['data'] as Map<String, dynamic>),
      errors: json['errors'] as String?,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$RecommendationDoctorsResponseToJson(
        RecommendationDoctorsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'messsage': instance.message,
      'data': instance.doctorsData,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
    };

DoctorsPaginationData _$DoctorsPaginationDataFromJson(
        Map<String, dynamic> json) =>
    DoctorsPaginationData(
      pageSize: (json['pageSize'] as num?)?.toInt(),
      pageIndex: (json['pageIndex'] as num?)?.toInt(),
      count: (json['count'] as num).toInt(),
      doctorsList: (json['data'] as List<dynamic>)
          .map((e) => DoctorData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorsPaginationDataToJson(
        DoctorsPaginationData instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'pageIndex': instance.pageIndex,
      'count': instance.count,
      'data': instance.doctorsList,
    };

DoctorData _$DoctorDataFromJson(Map<String, dynamic> json) => DoctorData(
      id: json['id'] as String,
      profileImage: DoctorData._fixImageUrl(json['profileImage'] as String),
      fullName: json['fullName'] as String,
      specializationName: json['specializationName'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      rate: (json['rate'] as num).toDouble(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
    );

Map<String, dynamic> _$DoctorDataToJson(DoctorData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profileImage': instance.profileImage,
      'fullName': instance.fullName,
      'specializationName': instance.specializationName,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'rate': instance.rate,
      'reviewsCount': instance.reviewsCount,
    };
