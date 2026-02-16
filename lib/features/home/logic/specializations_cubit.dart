import 'package:doctors_app/features/home/data/repos/specializations_repo.dart';
import 'package:doctors_app/features/home/logic/specializations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsCubit extends Cubit<SpecializationsState> {
  final SpecializationsRepo _specializationsRepo;

  SpecializationsCubit(this._specializationsRepo)
      : super(const SpecializationsState.initial());

  void getSpecializations() async {
    emit(const SpecializationsState.loading());
    final response = await _specializationsRepo.getSpecializations();
    response.when(
      success: (data) {
        emit(SpecializationsState.success(data));
      },
      failure: (error) {
        emit(SpecializationsState.error(error: error));
      },
    );
  }
}
