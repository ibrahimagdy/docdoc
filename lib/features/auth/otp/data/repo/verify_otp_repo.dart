import 'package:doctors_app/core/networking/api_error_handler.dart';
import 'package:doctors_app/core/networking/api_result.dart';
import 'package:doctors_app/core/networking/api_service.dart';
import 'package:doctors_app/features/auth/otp/data/models/verify_otp_request_model.dart';
import 'package:doctors_app/features/auth/otp/data/models/verify_otp_response_model.dart';

class VerifyOtpRepo {
  final ApiService _apiService;

  VerifyOtpRepo(this._apiService);

  Future<ApiResult<VerifyOtpResponseModel>> verifyOtp(
      VerifyOtpRequestModel verifyOtpRequestModel) async {
    try {
      final response = await _apiService.otpVerification(verifyOtpRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}