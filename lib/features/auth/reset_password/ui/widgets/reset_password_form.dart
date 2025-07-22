import 'package:doctors_app/core/helpers/app_regex.dart';
import 'package:doctors_app/core/helpers/app_validation.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/widgets/app_text_button.dart';
import 'package:doctors_app/core/widgets/app_text_form_field.dart';
import 'package:doctors_app/features/auth/login/ui/widgets/password_validations.dart';
import 'package:doctors_app/features/auth/reset_password/logic/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late ResetPasswordCubit cubit;
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController newPasswordController;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ResetPasswordCubit>();
    newPasswordController = cubit.newPasswordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    newPasswordController.addListener((){
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(newPasswordController.text);
        hasUpperCase = AppRegex.hasUpperCase(newPasswordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(newPasswordController.text);
        hasNumber = AppRegex.hasNumber(newPasswordController.text);
        hasMinLength = AppRegex.hasMinLength(newPasswordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            controller: cubit.newPasswordController,
            hintText: 'New Password',
            isObscureText: isPasswordObscureText,
            validator: validatePassword,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: cubit.confirmPasswordController,
            hintText: 'Confirm Password',
            isObscureText: isPasswordConfirmationObscureText,
            validator: (value) => validateConfirmPassword(
              value,
              cubit.newPasswordController.text,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText = !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
          const Spacer(),
          AppTextButton(
            onPressed: cubit.resetPassword,
            text: 'Done',
          ),
        ],
      ),
    );
  }
}
