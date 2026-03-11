import 'package:json_annotation/json_annotation.dart';

part 'recommendation_doctors_response.g.dart';

@JsonSerializable()
class RecommendationDoctorsResponse {
  final bool success;
  @JsonKey(name: 'messsage')
  final String message;
  @JsonKey(name: 'data')
  final DoctorsPaginationData? doctorsData;
  final String? errors;
  final int statusCode;

  RecommendationDoctorsResponse({
    required this.success,
    required this.message,
    this.doctorsData,
    this.errors,
    required this.statusCode,
  });

  factory RecommendationDoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendationDoctorsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationDoctorsResponseToJson(this);
}

@JsonSerializable()
class DoctorsPaginationData {
  final int? pageSize;
  final int? pageIndex;
  final int count;
  @JsonKey(name: 'data')
  final List<DoctorData> doctorsList;

  DoctorsPaginationData({
    this.pageSize,
    this.pageIndex,
    required this.count,
    required this.doctorsList,
  });

  factory DoctorsPaginationData.fromJson(Map<String, dynamic> json) =>
      _$DoctorsPaginationDataFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorsPaginationDataToJson(this);
}

@JsonSerializable()
class DoctorData {
  final String id;
  @JsonKey(fromJson: _fixImageUrl)
  final String profileImage;
  final String fullName;
  final String specializationName;
  final String address;
  final double rate;
  final int reviewsCount;

  DoctorData({
    required this.id,
    required this.profileImage,
    required this.fullName,
    required this.specializationName,
    required this.address,
    required this.rate,
    required this.reviewsCount,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) =>
      _$DoctorDataFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDataToJson(this);

  static String _fixImageUrl(String url) {
    return url.replaceAll('\\', '/');
  }
}
