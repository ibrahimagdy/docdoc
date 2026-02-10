import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/profile/logic/profile_cubit.dart';
import 'package:doctors_app/features/profile/logic/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileNameAndEmail extends StatelessWidget {
  const ProfileNameAndEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (profileData) {
            return Column(
              children: [
                Text(
                  profileData.userData.fullName,
                  style: TextStyles.font20BlackSemiBold,
                ),
                verticalSpace(4),
                Text(
                  profileData.userData.email,
                  style: TextStyles.font14DarkBlueRegular.copyWith(
                    color: ColorManger.darkBlue.withValues(alpha: 0.4),
                  ),
                ),
              ],
            );
          },
          orElse: () => Column(
            children: [
              Text(
                '',
                style: TextStyles.font20BlackSemiBold,
              ),
              verticalSpace(4),
              Text(
                '',
                style: TextStyles.font14DarkBlueRegular.copyWith(
                  color: ColorManger.darkBlue.withValues(alpha: 0.4),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
