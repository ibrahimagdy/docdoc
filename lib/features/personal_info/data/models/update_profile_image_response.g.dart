// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProfileImageResponse _$AddProfileImageResponseFromJson(
        Map<String, dynamic> json) =>
    AddProfileImageResponse(
      success: json['success'] as bool,
      message: json['messsage'] as String,
      data: json['data'] as String?,
      errors: json['errors'] as String?,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$AddProfileImageResponseToJson(
        AddProfileImageResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'messsage': instance.message,
      'data': instance.data,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
    };
