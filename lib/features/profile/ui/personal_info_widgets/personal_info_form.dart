import 'package:doctors_app/core/helpers/app_validation.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/widgets/app_text_form_field.dart';
import 'package:doctors_app/features/profile/logic/profile_patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {

  late ProfilePatientCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ProfilePatientCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.userNameController,
            validator: validateUsername,
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: cubit.emailController,
            validator: validateEmail,
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: cubit.phoneController,
            validator: validateEgyptianPhoneNumber,
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}