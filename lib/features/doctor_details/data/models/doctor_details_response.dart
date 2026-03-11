import 'package:json_annotation/json_annotation.dart';

part 'doctor_details_response.g.dart';

@JsonSerializable()
class DoctorDetailsResponse {
  final bool success;
  @JsonKey(name: 'messsage')
  final String message;
  @JsonKey(name: 'data')
  final DoctorDetailsData? doctorDetails;
  final String? errors;
  final int statusCode;

  DoctorDetailsResponse({
    required this.success,
    required this.message,
    this.doctorDetails,
    this.errors,
    required this.statusCode,
  });

  factory DoctorDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDetailsResponseToJson(this);
}

@JsonSerializable()
class DoctorDetailsData {
  final String id;
  final String fullName;
  @JsonKey(name: 'profileImageUrl', fromJson: _fixImageUrl)
  final String profileImage;
  final String specializationName;
  final String workingTime;
  final String aboutMe;
  final String address;
  final int yearsOfExperience;
  final String degree;
  final double rate;
  final int reviewsCount;
  final double latitude;
  final double longitude;

  DoctorDetailsData({
    required this.id,
    required this.fullName,
    required this.profileImage,
    required this.specializationName,
    required this.workingTime,
    required this.aboutMe,
    required this.address,
    required this.yearsOfExperience,
    required this.degree,
    required this.rate,
    required this.reviewsCount,
    required this.latitude,
    required this.longitude,
  });

  factory DoctorDetailsData.fromJson(Map<String, dynamic> json) =>
      _$DoctorDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDetailsDataToJson(this);

  static String _fixImageUrl(String url) {
    return url.replaceAll('\\', '/');
  }
}
