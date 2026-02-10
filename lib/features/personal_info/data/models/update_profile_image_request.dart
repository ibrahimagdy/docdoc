import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_image_request.g.dart';

@JsonSerializable()
class AddProfileImageRequest {
  @JsonKey(fromJson: FileConverter.fromJson, toJson: FileConverter.toJson)
  final File? profileImageUrl;

  AddProfileImageRequest({
    this.profileImageUrl,
  });

  factory AddProfileImageRequest.fromJson(Map<String, dynamic> json) =>
      _$AddProfileImageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddProfileImageRequestToJson(this);

  Future<FormData> toFormData() async {
    final formData = FormData();

    if (profileImageUrl != null && await profileImageUrl!.exists()) {
      formData.files.add(
        MapEntry(
          'File',
          await MultipartFile.fromFile(
            profileImageUrl!.path,
            filename: profileImageUrl!.path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    }

    return formData;
  }
}

class FileConverter {
  static File? fromJson(String? path) {
    if (path == null) return null;
    return File(path);
  }

  static String? toJson(File? file) {
    if (file == null) return null;
    return file.path;
  }
}