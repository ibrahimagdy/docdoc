import 'package:doctors_app/features/auth/forgot_password/ui/widgets/forgot_password_bloc_listener.dart';
import 'package:doctors_app/features/auth/forgot_password/ui/widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: const Column(
            children: [
              Expanded(child: ForgotPasswordForm()),
              ForgotPasswordBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
