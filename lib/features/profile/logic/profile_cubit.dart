import 'package:doctors_app/features/profile/data/repos/profile_patient_repo.dart';
import 'package:doctors_app/features/profile/logic/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfilePatientRepo _profilePatientRepo;

  ProfileCubit(this._profilePatientRepo) : super(const ProfileState.initial());

  void getProfileData() async {
    emit(const ProfileState.loading());
    final response = await _profilePatientRepo.profilePatient();
    response.when(
      success: (profileData) {
        emit(ProfileState.success(profileData));
      },
      failure: (error) {
        emit(ProfileState.error(error: error));
      },
    );
  }
}
