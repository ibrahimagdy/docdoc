// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsResponse _$ReviewsResponseFromJson(Map<String, dynamic> json) =>
    ReviewsResponse(
      success: json['success'] as bool,
      message: json['messsage'] as String,
      reviewsData: json['data'] == null
          ? null
          : ReviewsPaginationData.fromJson(
              json['data'] as Map<String, dynamic>),
      errors: json['errors'] as String?,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$ReviewsResponseToJson(ReviewsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'messsage': instance.message,
      'data': instance.reviewsData,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
    };

ReviewsPaginationData _$ReviewsPaginationDataFromJson(
        Map<String, dynamic> json) =>
    ReviewsPaginationData(
      pageSize: (json['pageSize'] as num?)?.toInt(),
      pageIndex: (json['pageIndex'] as num?)?.toInt(),
      count: (json['count'] as num).toInt(),
      reviewsList: (json['data'] as List<dynamic>)
          .map((e) => ReviewData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewsPaginationDataToJson(
        ReviewsPaginationData instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'pageIndex': instance.pageIndex,
      'count': instance.count,
      'data': instance.reviewsList,
    };

ReviewData _$ReviewDataFromJson(Map<String, dynamic> json) => ReviewData(
      id: json['id'] as String,
      profileImageUrl:
          ReviewData._fixImageUrl(json['profileImageUrl'] as String),
      fullName: json['fullName'] as String,
      rate: (json['rate'] as num).toInt(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$ReviewDataToJson(ReviewData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profileImageUrl': instance.profileImageUrl,
      'fullName': instance.fullName,
      'rate': instance.rate,
      'comment': instance.comment,
    };
