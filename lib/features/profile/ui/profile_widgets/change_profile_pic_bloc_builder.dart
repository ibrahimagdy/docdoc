import 'package:doctors_app/features/profile/logic/profile_patient_cubit.dart';
import 'package:doctors_app/features/profile/logic/profile_patient_state.dart';
import 'package:doctors_app/features/profile/ui/profile_widgets/change_profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeProfilePicBlocBuilder extends StatelessWidget {
  const ChangeProfilePicBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePatientCubit, ProfilePatientState>(
      builder: (context, state) {
        final profileImageUrl = context
            .read<ProfilePatientCubit>()
            .currentUserData
            ?.profileImage;
        return ChangeProfilePic(
          profileImageUrl: profileImageUrl,
        );
      },
    );
  }
}
