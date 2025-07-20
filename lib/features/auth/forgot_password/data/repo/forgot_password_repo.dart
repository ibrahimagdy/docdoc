import 'package:doctors_app/core/networking/api_error_handler.dart';
import 'package:doctors_app/core/networking/api_result.dart';
import 'package:doctors_app/core/networking/api_service.dart';
import 'package:doctors_app/features/auth/forgot_password/data/models/forgot_password_request_model.dart';
import 'package:doctors_app/features/auth/forgot_password/data/models/forgot_password_response_model.dart';

class ForgotPasswordRepo {
  final ApiService _apiService;

  ForgotPasswordRepo(this._apiService);

  Future<ApiResult<ForgotPasswordResponseModel>> forgotPassword(
      ForgotPasswordRequestModel forgotPasswordRequestModel) async {
    try {
      final response = await _apiService.forgotPassword(forgotPasswordRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}