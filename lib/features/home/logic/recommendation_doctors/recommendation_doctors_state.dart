import 'package:doctors_app/core/networking/api_error_model.dart';
import 'package:doctors_app/features/home/data/models/recommendation_doctors_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommendation_doctors_state.freezed.dart';

@Freezed()
class RecommendationDoctorsState with _$RecommendationDoctorsState {
  const factory RecommendationDoctorsState.initial() = _Initial;
  const factory RecommendationDoctorsState.loading() = Loading;
  const factory RecommendationDoctorsState.success(
      RecommendationDoctorsResponse data) = Success;
  const factory RecommendationDoctorsState.error(
      {required ApiErrorModel error}) = Error;
}
