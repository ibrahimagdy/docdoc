import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/core/networking/api_error_handler.dart';
import 'package:doctors_app/core/networking/api_result.dart';
import 'package:doctors_app/core/networking/api_service.dart';
import 'package:doctors_app/features/doctor_details/data/models/reviews_response.dart';

class ReviewsRepo {
  final ApiService _apiService;

  ReviewsRepo(this._apiService);

  Future<ApiResult<ReviewsResponse>> getReviews({
    required String doctorId,
    int? pageSize,
    int? pageIndex,
  }) async {
    try {
      final userToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );
      final authHeader = 'Bearer $userToken';
      final response = await _apiService.getReviews(
        authHeader,
        doctorId,
        pageSize,
        pageIndex,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
