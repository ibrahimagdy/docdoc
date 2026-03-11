import 'package:doctors_app/core/networking/api_error_model.dart';
import 'package:doctors_app/features/doctor_details/data/repos/doctor_details_repo.dart';
import 'package:doctors_app/features/doctor_details/logic/doctor_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  final DoctorDetailsRepo _doctorDetailsRepo;

  DoctorDetailsCubit(this._doctorDetailsRepo)
      : super(const DoctorDetailsState.initial());

  void getDoctorDetails(String doctorId) async {
    emit(const DoctorDetailsState.loading());
    final response = await _doctorDetailsRepo.getDoctorDetails(
      doctorId: doctorId,
    );
    response.when(
      success: (data) {
        if (data.doctorDetails != null) {
          emit(DoctorDetailsState.success(data.doctorDetails!));
        } else {
          emit(DoctorDetailsState.error(
            error: ApiErrorModel(message: 'Doctor details not found'),
          ));
        }
      },
      failure: (error) {
        emit(DoctorDetailsState.error(error: error));
      },
    );
  }
}
