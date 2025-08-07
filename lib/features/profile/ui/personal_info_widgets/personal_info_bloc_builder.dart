import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/widgets/app_text_button.dart';
import 'package:doctors_app/features/profile/logic/profile_patient_cubit.dart';
import 'package:doctors_app/features/profile/logic/profile_patient_state.dart';
import 'package:doctors_app/features/profile/ui/personal_info_widgets/personal_info_form.dart';
import 'package:doctors_app/features/profile/ui/personal_info_widgets/personal_info_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoBlocBuilder extends StatefulWidget {
  const PersonalInfoBlocBuilder({super.key});

  @override
  State<PersonalInfoBlocBuilder> createState() => _PersonalInfoBlocBuilderState();
}

class _PersonalInfoBlocBuilderState extends State<PersonalInfoBlocBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<ProfilePatientCubit>().getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePatientCubit, ProfilePatientState>(
      builder: (context, state) {
        return state.when(
          initial: () => const PersonalInfoSkeleton(),
          profilePatientLoading: () => const PersonalInfoSkeleton(),
          profilePatientSuccess: (response) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<ProfilePatientCubit>().setUserData(response.userData);
            });
            return const PersonalInfoForm();
          },
          profilePatientError: (error) => Column(
            children: [
              AppTextButton(
                text: 'Retry',
                onPressed: () {
                  context.read<ProfilePatientCubit>().getProfileData();
                },
              ),
              verticalSpace(16),
              const PersonalInfoForm(),
            ],
          ),
        );
      },
    );
  }
}