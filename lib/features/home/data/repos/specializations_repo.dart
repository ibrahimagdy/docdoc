import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/core/networking/api_error_handler.dart';
import 'package:doctors_app/core/networking/api_result.dart';
import 'package:doctors_app/core/networking/api_service.dart';
import 'package:doctors_app/features/home/data/models/specializations_response.dart';

class SpecializationsRepo {
  final ApiService _apiService;

  SpecializationsRepo(this._apiService);

  Future<ApiResult<SpecializationsResponse>> getSpecializations() async {
    try {
      final userToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );
      final authHeader = 'Bearer $userToken';
      final response = await _apiService.getSpecializations(authHeader);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
