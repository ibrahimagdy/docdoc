import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/core/networking/api_error_handler.dart';
import 'package:doctors_app/core/networking/api_result.dart';
import 'package:doctors_app/core/networking/api_service.dart';
import 'package:doctors_app/features/doctor_details/data/models/doctor_details_response.dart';

class DoctorDetailsRepo {
  final ApiService _apiService;

  DoctorDetailsRepo(this._apiService);

  Future<ApiResult<DoctorDetailsResponse>> getDoctorDetails({
    required String doctorId,
  }) async {
    try {
      final userToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );
      final authHeader = 'Bearer $userToken';
      final response = await _apiService.getDoctorDetails(
        authHeader,
        doctorId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
