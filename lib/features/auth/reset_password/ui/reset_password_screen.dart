import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/auth/reset_password/ui/widgets/reset_password_bloc_listener.dart';
import 'package:doctors_app/features/auth/reset_password/ui/widgets/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset Password',
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8),
              Text(
                'Secure your account with new password',
                style: TextStyles.font14GreyRegular,
              ),
              verticalSpace(64),
              const Expanded(child: ResetPasswordForm()),
              const ResetPasswordBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
