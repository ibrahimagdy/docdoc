import 'package:json_annotation/json_annotation.dart';

part 'reviews_response.g.dart';

@JsonSerializable()
class ReviewsResponse {
  final bool success;
  @JsonKey(name: 'messsage')
  final String message;
  @JsonKey(name: 'data')
  final ReviewsPaginationData? reviewsData;
  final String? errors;
  final int statusCode;

  ReviewsResponse({
    required this.success,
    required this.message,
    this.reviewsData,
    this.errors,
    required this.statusCode,
  });

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsResponseToJson(this);
}

@JsonSerializable()
class ReviewsPaginationData {
  final int? pageSize;
  final int? pageIndex;
  final int count;
  @JsonKey(name: 'data')
  final List<ReviewData> reviewsList;

  ReviewsPaginationData({
    this.pageSize,
    this.pageIndex,
    required this.count,
    required this.reviewsList,
  });

  factory ReviewsPaginationData.fromJson(Map<String, dynamic> json) =>
      _$ReviewsPaginationDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsPaginationDataToJson(this);
}

@JsonSerializable()
class ReviewData {
  final String id;
  @JsonKey(fromJson: _fixImageUrl)
  final String profileImageUrl;
  final String fullName;
  final int rate;
  final String comment;

  ReviewData({
    required this.id,
    required this.profileImageUrl,
    required this.fullName,
    required this.rate,
    required this.comment,
  });

  factory ReviewData.fromJson(Map<String, dynamic> json) =>
      _$ReviewDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewDataToJson(this);

  static String _fixImageUrl(String url) {
    if (url.isEmpty) return '';
    return url.replaceAll('\\', '/');
  }
}
