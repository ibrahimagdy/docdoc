import 'dart:io';
import 'package:dio/dio.dart';
import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/core/networking/api_error_handler.dart';
import 'package:doctors_app/core/networking/api_result.dart';
import 'package:doctors_app/core/networking/api_service.dart';
import 'package:doctors_app/features/personal_info/data/models/update_profile_image_response.dart';
import 'package:doctors_app/features/personal_info/data/models/update_profile_request.dart';
import 'package:doctors_app/features/profile/data/models/get_profile_patient_response.dart';

class PersonalInfoRepo {
  final ApiService _apiService;

  PersonalInfoRepo(this._apiService);

  Future<ApiResult<GetProfilePatientResponse>> updateProfile(
      UpdateProfileRequest updateProfileRequest) async {
    try {
      final userToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );
      final authHeader = 'Bearer $userToken';
      final response = await _apiService.updateProfile(
        authHeader,
        updateProfileRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddProfileImageResponse>> uploadProfileImage(
      File image) async {
    try {
      final userToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );
      final authHeader = 'Bearer $userToken';

      final formData = FormData.fromMap({
        'File': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      });

      final response = await _apiService.uploadProfileImage(
        authHeader,
        formData,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddProfileImageResponse>> deleteProfileImage() async {
    try {
      final userToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );
      final authHeader = 'Bearer $userToken';

      final response = await _apiService.deleteProfileImage(
        authHeader,
        {},
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
