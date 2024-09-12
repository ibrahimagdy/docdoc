import 'package:doctors_app/core/theming/font_weight.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyles.font12DarkBlueRegular
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyles.font12BlueRegular.copyWith(fontWeight: FontWeightHelper.semiBold)
          ),
        ],
      ),
    );
  }
}
