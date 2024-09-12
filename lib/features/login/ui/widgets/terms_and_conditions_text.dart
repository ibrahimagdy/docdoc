import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: TextStyles.font12GreyRegular,
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: TextStyles.font12DarkBlueRegular,
          ),
          TextSpan(
            text: ' and',
            style: TextStyles.font12GreyRegular,
          ),
          TextSpan(
            text: ' Privacy Policy.',
            style: TextStyles.font12DarkBlueRegular.copyWith(height: 1.5),
          ),

        ]
      ),
    );
  }
}
