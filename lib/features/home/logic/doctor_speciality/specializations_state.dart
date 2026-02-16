import 'package:doctors_app/core/networking/api_error_model.dart';
import 'package:doctors_app/features/home/data/models/specializations_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'specializations_state.freezed.dart';

@Freezed()
class SpecializationsState with _$SpecializationsState {
  const factory SpecializationsState.initial() = _Initial;
  const factory SpecializationsState.loading() = Loading;
  const factory SpecializationsState.success(SpecializationsResponse data) = Success;
  const factory SpecializationsState.error({required ApiErrorModel error}) = Error;
}