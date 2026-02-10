import 'dart:io';
import 'package:doctors_app/features/personal_info/data/models/update_profile_request.dart';
import 'package:doctors_app/features/personal_info/data/repos/personal_info_repo.dart';
import 'package:doctors_app/features/personal_info/logic/personal_info_state.dart';
import 'package:doctors_app/features/profile/logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  final PersonalInfoRepo _personalInfoRepo;
  final ProfileCubit _profileCubit;

  PersonalInfoCubit(this._personalInfoRepo, this._profileCubit)
      : super(const PersonalInfoState.initial()) {
    _initializeControllers();
  }

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  File? selectedImage;
  String? currentImageUrl;
  bool _imageChanged = false;
  bool _imageDeleted = false;

  String _originalFullName = '';
  String _originalEmail = '';
  String _originalPhoneNumber = '';

  void _initializeControllers() {
    final state = _profileCubit.state;
    state.whenOrNull(
      success: (profileData) {
        _originalFullName = profileData.userData.fullName;
        _originalEmail = profileData.userData.email;
        _originalPhoneNumber = profileData.userData.phoneNumber ?? '';

        fullNameController.text = _originalFullName;
        emailController.text = _originalEmail;
        phoneNumberController.text = _originalPhoneNumber;
        currentImageUrl = profileData.userData.profileImage;

        fullNameController.addListener(_checkForChanges);
        emailController.addListener(_checkForChanges);
        phoneNumberController.addListener(_checkForChanges);
      },
    );
  }

  void _checkForChanges() {
    final hasTextChanges = fullNameController.text != _originalFullName ||
        emailController.text != _originalEmail ||
        phoneNumberController.text != _originalPhoneNumber;

    final hasChanges = hasTextChanges || _imageChanged || _imageDeleted;

    emit(PersonalInfoState.dataChanged(hasChanges: hasChanges));
  }

  bool _hasTextChanges() {
    return fullNameController.text != _originalFullName ||
        emailController.text != _originalEmail ||
        phoneNumberController.text != _originalPhoneNumber;
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImage = File(image.path);
      _imageChanged = true;
      _imageDeleted = false;
      _checkForChanges();
    }
  }

  Future<void> pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      selectedImage = File(image.path);
      _imageChanged = true;
      _imageDeleted = false;
      _checkForChanges();
    }
  }

  void deleteImage() {
    selectedImage = null;
    currentImageUrl = null;
    _imageDeleted = true;
    _imageChanged = false;
    _checkForChanges();
  }

  Future<void> updateProfile() async {
    emit(const PersonalInfoState.updatingProfile());

    try {
      bool imageOperationSuccess = true;

      if (_imageChanged && selectedImage != null) {
        final imageResponse =
            await _personalInfoRepo.uploadProfileImage(selectedImage!);

        await imageResponse.when(
          success: (data) async {
            imageOperationSuccess = true;
          },
          failure: (error) {
            imageOperationSuccess = false;
            emit(PersonalInfoState.profileUpdateError(
                error.getAllErrorMessages()));
          },
        );

        if (!imageOperationSuccess) return;
      } else if (_imageDeleted) {
        final deleteResponse = await _personalInfoRepo.deleteProfileImage();

        await deleteResponse.when(
          success: (data) async {
            imageOperationSuccess = true;
          },
          failure: (error) {
            imageOperationSuccess = false;
            emit(PersonalInfoState.profileUpdateError(
                error.getAllErrorMessages()));
          },
        );

        if (!imageOperationSuccess) return;
      }

      if (_hasTextChanges()) {
        final request = UpdateProfileRequest(
          fullName: fullNameController.text,
          email: emailController.text,
          phoneNumber: phoneNumberController.text,
        );

        final response = await _personalInfoRepo.updateProfile(request);

        response.when(
          success: (profileData) {
            _updateOriginalData();
            emit(const PersonalInfoState.profileUpdated());
            _profileCubit.getProfileData();
            _checkForChanges();
          },
          failure: (error) {
            emit(PersonalInfoState.profileUpdateError(
                error.getAllErrorMessages()));
          },
        );
      } else {
        _updateOriginalData();
        emit(const PersonalInfoState.profileUpdated());
        _profileCubit.getProfileData();
        _checkForChanges();
      }
    } catch (e) {
      emit(PersonalInfoState.profileUpdateError(e.toString()));
    }
  }

  void _updateOriginalData() {
    _originalFullName = fullNameController.text;
    _originalEmail = emailController.text;
    _originalPhoneNumber = phoneNumberController.text;
    _imageChanged = false;
    _imageDeleted = false;
    selectedImage = null;
  }

  @override
  Future<void> close() {
    fullNameController.removeListener(_checkForChanges);
    emailController.removeListener(_checkForChanges);
    phoneNumberController.removeListener(_checkForChanges);
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}
