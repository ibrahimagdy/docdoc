import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/app_text_button.dart';
import 'package:doctors_app/core/widgets/app_text_form_field.dart';
import 'package:doctors_app/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:doctors_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GreyRegular,
                ),
                verticalSpace(36),
                const AppTextFormField(
                  hintText: 'Email',
                ),
                verticalSpace(16),
                AppTextFormField(
                  hintText: 'Password',
                  isObscureText: isObscureText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    child: Icon(isObscureText
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
                verticalSpace(16),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget Password?',
                      style: TextStyles.font12BlueRegular,
                    ),
                  ),
                ),
                verticalSpace(32),
                AppTextButton(
                  text: 'Login',
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {},
                ),
                verticalSpace(16),
                const TermsAndConditionsText(),
                verticalSpace(60),
                const Align(
                  alignment: Alignment.center,
                  child: DontHaveAccountText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
