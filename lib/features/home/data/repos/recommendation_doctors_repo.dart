import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/core/networking/api_error_handler.dart';
import 'package:doctors_app/core/networking/api_result.dart';
import 'package:doctors_app/core/networking/api_service.dart';
import 'package:doctors_app/features/home/data/models/recommendation_doctors_response.dart';

class RecommendationDoctorsRepo {
  final ApiService _apiService;

  RecommendationDoctorsRepo(this._apiService);

  Future<ApiResult<RecommendationDoctorsResponse>>
      getRecommendationDoctors() async {
    try {
      final userToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );
      final authHeader = 'Bearer $userToken';
      final response = await _apiService.getRecommendationDoctors(authHeader);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
