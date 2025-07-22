import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/auth/otp/ui/widgets/otp_bloc_listener.dart';
import 'package:doctors_app/features/auth/otp/ui/widgets/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                'OTP Verification',
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8),
              Text(
                'Add a PIN number to make your account more secure and easy to sign in.',
                style: TextStyles.font14GreyRegular,
              ),
              verticalSpace(64),
              const Expanded(child: OtpForm()),
              const OtpBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
