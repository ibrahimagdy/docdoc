import 'package:doctors_app/core/networking/api_error_model.dart';
import 'package:doctors_app/features/doctor_details/data/models/reviews_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reviews_state.freezed.dart';

@Freezed()
class ReviewsState with _$ReviewsState {
  const factory ReviewsState.initial() = _Initial;
  const factory ReviewsState.loading() = Loading;
  const factory ReviewsState.success(List<ReviewData> reviews) = Success;
  const factory ReviewsState.error({required ApiErrorModel error}) = Error;
}
