import 'package:doctors_app/core/networking/api_error_model.dart';
import 'package:doctors_app/features/doctor_details/data/models/doctor_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_details_state.freezed.dart';

@Freezed()
class DoctorDetailsState with _$DoctorDetailsState {
  const factory DoctorDetailsState.initial() = _Initial;
  const factory DoctorDetailsState.loading() = Loading;
  const factory DoctorDetailsState.success(DoctorDetailsData data) = Success;
  const factory DoctorDetailsState.error({required ApiErrorModel error}) =
      Error;
}
