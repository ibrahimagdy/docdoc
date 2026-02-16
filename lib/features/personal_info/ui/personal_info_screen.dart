import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/app_text_button.dart';
import 'package:doctors_app/core/widgets/app_text_form_field.dart';
import 'package:doctors_app/core/widgets/custom_app_bar.dart';
import 'package:doctors_app/core/widgets/custom_snack_bar.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:doctors_app/features/personal_info/logic/personal_info_cubit.dart';
import 'package:doctors_app/features/personal_info/logic/personal_info_state.dart';
import 'package:doctors_app/features/personal_info/ui/widgets/image_source_bottom_sheet.dart';
import 'package:doctors_app/features/profile/logic/profile_cubit.dart';
import 'package:doctors_app/features/profile/ui/widgets/change_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctors_app/core/di/dependency_injection.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();

    return BlocProvider(
      create: (context) => getIt<PersonalInfoCubit>(param1: profileCubit),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<PersonalInfoCubit, PersonalInfoState>(
            listener: (context, state) {
              state.whenOrNull(
                updatingProfile: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const Center(
                      child: LoadingCircleIndicator(),
                    ),
                  );
                },
                profileUpdated: () {
                  context.pop();
                  context.pop();
                  CustomSnackBar.showSuccess(
                    context,
                    'Profile updated successfully',
                  );
                },
                profileUpdateError: (error) {
                  context.pop();
                  CustomSnackBar.showError(context, error);
                },
              );
            },
            builder: (context, state) {
              final cubit = context.read<PersonalInfoCubit>();

              bool hasChanges = false;
              state.whenOrNull(
                dataChanged: (changes) {
                  hasChanges = changes;
                },
              );

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    verticalSpace(16),
                    const CustomAppBar(
                      title: "Personal Information",
                    ),
                    verticalSpace(42),
                    ChangeProfileAvatar(
                      whiteRadius: 59,
                      avatarRadius: 60,
                      usePositioned: false,
                      onTap: () {
                        _showImageSourceBottomSheet(context, cubit);
                      },
                    ),
                    verticalSpace(51),
                    AppTextFormField(
                      hintText: 'Full Name',
                      controller: cubit.fullNameController,
                    ),
                    verticalSpace(16),
                    AppTextFormField(
                      hintText: 'Email',
                      controller: cubit.emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    verticalSpace(16),
                    AppTextFormField(
                      hintText: 'Phone Number',
                      controller: cubit.phoneNumberController,
                      keyboardType: TextInputType.phone,
                    ),
                    verticalSpace(24),
                    Text(
                      'When you set up your personal information settings, you should take care to provide accurate information.',
                      style: TextStyles.font12GreyRegular,
                    ),
                    verticalSpace(24),
                    const Spacer(),
                    AppTextButton(
                      text: 'Save',
                      onPressed: hasChanges
                          ? () {
                              cubit.updateProfile();
                            }
                          : null,
                    ),
                    verticalSpace(16),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showImageSourceBottomSheet(
    BuildContext context,
    PersonalInfoCubit cubit,
  ) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        ),
      ),
      builder: (context) => ImageSourceBottomSheet(
        onCameraTap: () => cubit.pickImageFromCamera(),
        onGalleryTap: () => cubit.pickImageFromGallery(),
        onDeleteTap: () => cubit.deleteImage(),
      ),
    );
  }
}
