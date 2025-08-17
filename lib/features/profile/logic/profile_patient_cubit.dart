import 'dart:io';
import 'package:doctors_app/core/networking/api_error_model.dart';
import 'package:doctors_app/features/profile/data/models/get_profile_patient_response.dart';
import 'package:doctors_app/features/profile/data/repos/profile_patient_repo.dart';
import 'package:doctors_app/features/profile/logic/profile_patient_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
        setUserData(profilePatientResponse.userData);
        emit(ProfilePatientState.profilePatientSuccess(profilePatientResponse));
      },
      failure: (error) {
        emit(ProfilePatientState.profilePatientError(error));
      },
    );
  }

  Future<void> uploadProfileImage() async {
    try {
      final ImagePicker picker = ImagePicker();

      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image == null) return;

      final File imageFile = File(image.path);

      emit(const ProfilePatientState.uploadImageLoading());

      final result = await _profilePatientRepo.uploadProfileImage(imageFile);

      result.when(
        success: (uploadResponse) {
          emit(ProfilePatientState.uploadImageSuccess(uploadResponse));
          getProfileData();
        },
        failure: (error) {
          emit(ProfilePatientState.uploadImageError(error));
        },
      );
    } catch (error) {
      emit(ProfilePatientState.uploadImageError(
          ApiErrorModel(message: error.toString())
      ));
    }
  }

  Future<void> pickImageFromCamera() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image == null) return;

      final File imageFile = File(image.path);

      emit(const ProfilePatientState.uploadImageLoading());

      final result = await _profilePatientRepo.uploadProfileImage(imageFile);

      result.when(
        success: (uploadResponse) {
          emit(ProfilePatientState.uploadImageSuccess(uploadResponse));
          getProfileData();
        },
        failure: (error) {
          emit(ProfilePatientState.uploadImageError(error));
        },
      );
    } catch (error) {
      emit(ProfilePatientState.uploadImageError(
          ApiErrorModel(message: error.toString())
      ));
    }
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