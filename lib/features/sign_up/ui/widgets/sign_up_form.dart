import 'package:doctors_app/core/helpers/app_regex.dart';
import 'package:doctors_app/core/helpers/app_validation.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/widgets/app_text_form_field.dart';
import 'package:doctors_app/features/login/ui/widgets/password_validations.dart';
import 'package:doctors_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  late SignUpCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<SignUpCubit>();
    passwordController = cubit.passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Full Name',
            validator: validateName,
            controller: cubit.fullNameController,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'User Name',
            validator: validateUsername,
            controller: cubit.userNameController,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Phone',
            validator: validateEgyptianPhoneNumber,
            controller: cubit.phoneController,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Email',
            validator: validateEmail,
            controller: cubit.emailController,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Password',
            validator: validatePassword,
            controller: cubit.passwordController,
            isObscureText: isPasswordObscureText,
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
            hintText: 'Password Confirmation',
            validator: (value) => validateConfirmPassword(
              value,
              cubit.passwordController.text,
            ),
            controller:
                context.read<SignUpCubit>().passwordConfirmationController,
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
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
        ],
      ),
    );
  }
}
