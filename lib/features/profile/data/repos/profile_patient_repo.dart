import 'dart:io';
import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/core/networking/api_error_handler.dart';
import 'package:doctors_app/core/networking/api_result.dart';
import 'package:doctors_app/core/networking/api_service.dart';
import 'package:doctors_app/features/profile/data/models/update_profile_image_request.dart';
import 'package:doctors_app/features/profile/data/models/update_profile_image_response.dart';
import 'package:doctors_app/features/profile/data/models/get_profile_patient_response.dart';

class ProfilePatientRepo {
  final ApiService _apiService;

  ProfilePatientRepo(this._apiService);

  Future<ApiResult<GetProfilePatientResponse>> profilePatient() async {
    try {
      final userToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );
      final authHeader = 'Bearer $userToken';
      final response = await _apiService.profilePatient(authHeader);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddProfileImageResponse>> uploadProfileImage(File imageFile) async {
    try {
      final userToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );
      final authHeader = 'Bearer $userToken';

      final request = AddProfileImageRequest(profileImageUrl: imageFile);
      final formData = await request.toFormData();

      final response = await _apiService.uploadProfileImage(authHeader, formData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}