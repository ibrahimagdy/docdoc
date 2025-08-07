import 'package:doctors_app/features/profile/data/models/get_profile_patient_response.dart';
import 'package:doctors_app/features/profile/data/repos/profile_patient_repo.dart';
import 'package:doctors_app/features/profile/logic/profile_patient_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePatientCubit extends Cubit<ProfilePatientState> {
  final ProfilePatientRepo _profilePatientRepo;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  UserData? _currentUserData;
  UserData? get currentUserData => _currentUserData;

  ProfilePatientCubit(this._profilePatientRepo)
      : super(const ProfilePatientState.initial());

  Future<void> getProfileData() async {
    emit(const ProfilePatientState.profilePatientLoading());

    final result = await _profilePatientRepo.profilePatient();
    result.when(
      success: (profilePatientResponse) {
        emit(ProfilePatientState.profilePatientSuccess(profilePatientResponse));
      },
      failure: (error) {
        emit(ProfilePatientState.profilePatientError(error));
      },
    );
  }

  void setUserData(UserData userData) {
    _currentUserData = userData;
    userNameController.text = userData.userName;
    emailController.text = userData.email;
    phoneController.text = userData.phoneNumber;
  }

  String get currentUserName => userNameController.text.trim();
  String get currentEmail => emailController.text.trim();
  String get currentPhoneNumber => phoneController.text.trim();

  bool get hasDataChanged {
    if (_currentUserData == null) return false;

    return currentUserName != _currentUserData!.userName ||
        currentEmail != _currentUserData!.email ||
        currentPhoneNumber != _currentUserData!.phoneNumber;
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    return super.close();
  }
}