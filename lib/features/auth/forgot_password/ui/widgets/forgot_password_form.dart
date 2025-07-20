import 'package:doctors_app/core/helpers/app_validation.dart';
import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/app_text_button.dart';
import 'package:doctors_app/core/widgets/app_text_form_field.dart';
import 'package:doctors_app/features/auth/forgot_password/logic/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {

  late ForgotPasswordCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<ForgotPasswordCubit>(context);
    super.initState();
  }

  void _submitForm() async {
    if (cubit.formKey.currentState!.validate()) {
      final String email = cubit.emailController.text;
      await SharedPrefHelper.setData('email', email);
      cubit.resetPassword(email);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forgot Password',
            style: TextStyles.font24BlueBold,
          ),
          verticalSpace(8),
          Text(
            'At our app, we take the security of your information seriously.',
            style: TextStyles.font14GreyRegular,
          ),
          verticalSpace(32),
          AppTextFormField(
            hintText: 'Email',
            validator: validateEmail,
            controller: cubit.emailController,
          ),
          const Spacer(),
          AppTextButton(
            text: 'Reset Password',
            onPressed: _submitForm,
            textStyle: TextStyles.font16WhiteSemiBold,
          ),
        ],
      ),
    );
  }
}