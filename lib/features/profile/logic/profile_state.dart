import 'package:doctors_app/core/networking/api_error_model.dart';
import 'package:doctors_app/features/profile/data/models/get_profile_patient_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@Freezed()
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.success(GetProfilePatientResponse profileData) = Success;
  const factory ProfileState.error({required ApiErrorModel error}) = Error;
}