// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_image_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProfileImageRequest _$AddProfileImageRequestFromJson(
        Map<String, dynamic> json) =>
    AddProfileImageRequest(
      profileImageUrl:
          FileConverter.fromJson(json['profileImageUrl'] as String?),
    );

Map<String, dynamic> _$AddProfileImageRequestToJson(
        AddProfileImageRequest instance) =>
    <String, dynamic>{
      'profileImageUrl': FileConverter.toJson(instance.profileImageUrl),
    };
