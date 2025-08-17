import 'package:doctors_app/core/helpers/image_picker_bottom_sheet.dart';
import 'package:doctors_app/core/widgets/custom_snack_bar.dart';
import 'package:doctors_app/features/profile/logic/profile_patient_cubit.dart';
import 'package:doctors_app/features/profile/logic/profile_patient_state.dart';
import 'package:doctors_app/features/profile/ui/profile_widgets/change_profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeProfilePicBlocBuilder extends StatelessWidget {
  final bool isClickable;

  const ChangeProfilePicBlocBuilder({
    super.key,
    this.isClickable = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfilePatientCubit, ProfilePatientState>(
      listener: (context, state) {
        state.maybeWhen(
          uploadImageSuccess: (response) {
            CustomSnackBar.showSuccess(context, response.message);
          },
          uploadImageError: (error) {
            CustomSnackBar.showError(context, 'Error uploading image');
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => ChangeProfilePic(
            profileImageUrl: null,
            isLoading: false,
            onTap: isClickable ? () => _showImagePickerOptions(context) : null,
          ),
          profilePatientLoading: () {
            final previousImageUrl =
                context.read<ProfilePatientCubit>().currentUserData?.profileImage;
            return ChangeProfilePic(
              profileImageUrl: previousImageUrl,
              isLoading: true,
              onTap: isClickable ? () => _showImagePickerOptions(context) : null,
            );
          },
          profilePatientSuccess: (response) => ChangeProfilePic(
            profileImageUrl: response.userData.profileImage,
            isLoading: false,
            onTap: isClickable ? () => _showImagePickerOptions(context) : null,
          ),
          profilePatientError: (error) {
            final previousImageUrl =
                context.read<ProfilePatientCubit>().currentUserData?.profileImage;
            return ChangeProfilePic(
              profileImageUrl: previousImageUrl,
              isLoading: false,
              onTap: isClickable ? () => _showImagePickerOptions(context) : null,
            );
          },
          uploadImageLoading: () {
            final currentImageUrl =
                context.read<ProfilePatientCubit>().currentUserData?.profileImage;
            return ChangeProfilePic(
              profileImageUrl: currentImageUrl,
              isLoading: true,
              onTap: null,
            );
          },
          uploadImageSuccess: (response) {
            final currentImageUrl =
                context.read<ProfilePatientCubit>().currentUserData?.profileImage;
            return ChangeProfilePic(
              profileImageUrl: currentImageUrl,
              isLoading: false,
              onTap: isClickable ? () => _showImagePickerOptions(context) : null,
            );
          },
          uploadImageError: (error) {
            final currentImageUrl =
                context.read<ProfilePatientCubit>().currentUserData?.profileImage;
            return ChangeProfilePic(
              profileImageUrl: currentImageUrl,
              isLoading: false,
              onTap: isClickable ? () => _showImagePickerOptions(context) : null,
            );
          },
        );
      },
    );
  }

  void _showImagePickerOptions(BuildContext context) {
    ChangeProfilePicBottomSheet.show(
      context,
      onGalleryTap: () {
        Navigator.pop(context);
        context.read<ProfilePatientCubit>().uploadProfileImage();
      },
      onCameraTap: () {
        Navigator.pop(context);
        context.read<ProfilePatientCubit>().pickImageFromCamera();
      },
    );
  }
}
