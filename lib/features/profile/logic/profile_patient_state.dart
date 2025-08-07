import 'package:doctors_app/core/networking/api_error_model.dart';
import 'package:doctors_app/features/profile/data/models/get_profile_patient_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_patient_state.freezed.dart';

@freezed
class ProfilePatientState with _$ProfilePatientState {
  const factory ProfilePatientState.initial() = _Initial;
  const factory ProfilePatientState.profilePatientLoading() =
      ProfilePatientLoading;

  const factory ProfilePatientState.profilePatientSuccess(
      GetProfilePatientResponse profilePatientResponse) = profilePatientSuccess;

  const factory ProfilePatientState.profilePatientError(ApiErrorModel error) =
      ProfilePatientError;
}
