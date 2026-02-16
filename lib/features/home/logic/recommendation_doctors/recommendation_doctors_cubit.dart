import 'package:doctors_app/features/home/data/repos/recommendation_doctors_repo.dart';
import 'package:doctors_app/features/home/logic/recommendation_doctors/recommendation_doctors_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationDoctorsCubit extends Cubit<RecommendationDoctorsState> {
  final RecommendationDoctorsRepo _recommendationDoctorsRepo;

  RecommendationDoctorsCubit(this._recommendationDoctorsRepo)
      : super(const RecommendationDoctorsState.initial());

  void getRecommendationDoctors() async {
    emit(const RecommendationDoctorsState.loading());
    final response =
        await _recommendationDoctorsRepo.getRecommendationDoctors();
    response.when(
      success: (data) {
        emit(RecommendationDoctorsState.success(data));
      },
      failure: (error) {
        emit(RecommendationDoctorsState.error(error: error));
      },
    );
  }
}
