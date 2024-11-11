import 'package:doctors_app/features/home/data/model/specialization_responses_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/networking/api_error_handler.dart';
part 'home_state.freezed.dart';

@Freezed()
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.specializationsLoading() = SpecializationsLoading;

  const factory HomeState.specializationsSuccess(
          List<SpecializationsData?>? specializationDataList) =
  SpecializationsSuccess;

  const factory HomeState.specializationsError(ErrorHandler errorHandler) =
      SpecializationsError;
}
