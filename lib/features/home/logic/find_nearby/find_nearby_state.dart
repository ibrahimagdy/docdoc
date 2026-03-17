import 'package:doctors_app/core/networking/api_error_model.dart';
import 'package:doctors_app/features/home/data/models/recommendation_doctors_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_nearby_state.freezed.dart';

@Freezed()
class FindNearbyState with _$FindNearbyState {
  const factory FindNearbyState.initial() = _Initial;
  const factory FindNearbyState.loading() = Loading;
  const factory FindNearbyState.success(List<DoctorData> doctors) = Success;
  const factory FindNearbyState.error({required ApiErrorModel error}) = Error;
}
