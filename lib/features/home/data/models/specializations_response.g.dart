// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specializations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationsResponse _$SpecializationsResponseFromJson(
        Map<String, dynamic> json) =>
    SpecializationsResponse(
      success: json['success'] as bool,
      message: json['messsage'] as String,
      specializationsList: (json['data'] as List<dynamic>)
          .map((e) => SpecializationData.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: json['errors'] as String?,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$SpecializationsResponseToJson(
        SpecializationsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'messsage': instance.message,
      'data': instance.specializationsList,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
    };

SpecializationData _$SpecializationDataFromJson(Map<String, dynamic> json) =>
    SpecializationData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      spcializationIcons:
          SpecializationData._fixImageUrl(json['spcializationIcons'] as String),
    );

Map<String, dynamic> _$SpecializationDataToJson(SpecializationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'spcializationIcons': instance.spcializationIcons,
    };
