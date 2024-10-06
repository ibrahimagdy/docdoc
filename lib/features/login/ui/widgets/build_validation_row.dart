import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class BuildValidationRow extends StatelessWidget {
  final String validateText;
  final bool hasValidate;

  const BuildValidationRow({
    super.key,
    required this.validateText,
    required this.hasValidate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: Colors.grey,
        ),
        horizontalSpace(6),
        Text(
          validateText,
          style: TextStyles.font12DarkBlueRegular.copyWith(
            decoration: hasValidate ? TextDecoration.lineThrough : null,
            decorationColor: Colors.lightGreen,
            decorationThickness: 2,
            color: hasValidate ? Colors.grey : ColorManger.darkBlue,
          ),
        ),
      ],
    );
  }
}
