import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Omar Ahmed',
          style: TextStyles.font20BlackSemiBold,
        ),
        verticalSpace(8),
        Text(
          'omarahmed14@gmail.com',
          style: TextStyles.font14DarkBlueRegular.copyWith(
            color: ColorManger.darkBlue.withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }
}