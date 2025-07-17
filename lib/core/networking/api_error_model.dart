import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final int? statusCode;
  final String? message;


  ApiErrorModel({
    required this.message,
    this.statusCode,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String getAllErrorMessages() {
    if (message != null && message!.isNotEmpty) {
      return message!;
    }
    return "";
  }
}