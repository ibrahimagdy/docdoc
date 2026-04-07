import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateMessageHeader extends StatelessWidget {
  const CreateMessageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.close,
            size: 24.sp,
            color: ColorManger.darkBlue,
          ),
        ),
        const Spacer(),
        Text(
          'Create New Message',
          style: TextStyles.font18DarkBlueBold,
        ),
        const Spacer(),
        horizontalSpace(24),
      ],
    );
  }
}
