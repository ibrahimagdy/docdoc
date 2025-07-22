import 'package:doctors_app/core/networking/api_error_handler.dart';
import 'package:doctors_app/core/networking/api_result.dart';
import 'package:doctors_app/core/networking/api_service.dart';
import 'package:doctors_app/features/auth/reset_password/data/models/reset_password_request_model.dart';
import 'package:doctors_app/features/auth/reset_password/data/models/reset_password_response_model.dart';

class ResetPasswordRepo {
  final ApiService _apiService;

  ResetPasswordRepo(this._apiService);

  Future<ApiResult<ResetPasswordResponseModel>> resetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel) async {
    try {
      final response = await _apiService.resetPassword(resetPasswordRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}