import 'package:json_annotation/json_annotation.dart';

part 'specializations_response.g.dart';

@JsonSerializable()
class SpecializationsResponse {
  final bool success;
  @JsonKey(name: 'messsage')
  final String message;
  @JsonKey(name: 'data')
  final List<SpecializationData> specializationsList;
  final String? errors;
  final int statusCode;

  SpecializationsResponse({
    required this.success,
    required this.message,
    required this.specializationsList,
    this.errors,
    required this.statusCode,
  });

  factory SpecializationsResponse.fromJson(Map<String, dynamic> json) =>
      _$SpecializationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationsResponseToJson(this);
}

@JsonSerializable()
class SpecializationData {
  final int id;
  final String name;
  @JsonKey(fromJson: _fixImageUrl)
  final String spcializationIcons;

  SpecializationData({
    required this.id,
    required this.name,
    required this.spcializationIcons,
  });

  factory SpecializationData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationDataFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationDataToJson(this);

  static String _fixImageUrl(String url) {
    return url.replaceAll('\\', '/');
  }
}
