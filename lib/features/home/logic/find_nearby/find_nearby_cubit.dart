import 'package:doctors_app/features/home/data/repos/recommendation_doctors_repo.dart';
import 'package:doctors_app/features/home/logic/find_nearby/find_nearby_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindNearbyCubit extends Cubit<FindNearbyState> {
  final RecommendationDoctorsRepo _recommendationDoctorsRepo;

  FindNearbyCubit(this._recommendationDoctorsRepo)
      : super(const FindNearbyState.initial());

  void getNearbyDoctors() async {
    emit(const FindNearbyState.loading());
    final response =
        await _recommendationDoctorsRepo.getRecommendationDoctors();
    response.when(
      success: (data) {
        final doctorsWithLocation = data.doctorsData?.doctorsList
                .where((doctor) =>
                    doctor.latitude != 0.0 && doctor.longitude != 0.0)
                .toList() ??
            [];
        emit(FindNearbyState.success(doctorsWithLocation));
      },
      failure: (error) {
        emit(FindNearbyState.error(error: error));
      },
    );
  }
}
