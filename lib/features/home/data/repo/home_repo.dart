import 'package:doctors_app/features/home/data/model/specialization_responses_model.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class HomeRepo{
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<SpecializationsResponseModel>> getHomeData() async {
    try {
      final response = await _apiService.getSpecialization();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}