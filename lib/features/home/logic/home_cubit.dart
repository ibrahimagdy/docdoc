import 'package:doctors_app/features/home/data/model/specialization_responses_model.dart';
import 'package:doctors_app/features/home/data/repo/home_repo.dart';
import 'package:doctors_app/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());


  List<SpecializationsData?>? specializationsList = [];

  void getSpeciality() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getHomeData();
    response.when(
      success: (specializationsResponseModel) {
        specializationsList =
            specializationsResponseModel.specializationsList ?? [];
        emit(HomeState.specializationsSuccess(
            specializationsResponseModel.specializationsList));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationsError(errorHandler));
      },
    );
  }
}
