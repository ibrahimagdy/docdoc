import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/font_weight.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepCircle extends StatelessWidget {
  final int stepNumber;
  final String title;
  final bool isCompleted;
  final bool isActive;

  const StepCircle({
    super.key,
    required this.stepNumber,
    required this.title,
    required this.isCompleted,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final Color circleColor = isCompleted
        ? ColorManger.green
        : isActive
            ? ColorManger.mainBlue
            : ColorManger.greyDivider;

    final Color labelColor = isCompleted
        ? ColorManger.green
        : isActive
            ? ColorManger.darkBlue
            : ColorManger.darkGrey;

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 32.w,
          height: 32.w,
          decoration: BoxDecoration(
            color: circleColor,
            shape: BoxShape.circle,
          ),
          child: isCompleted
              ? Icon(Icons.check, color: Colors.white, size: 19.sp)
              : Center(
                  child:
                      Text('$stepNumber', style: TextStyles.font12WhiteMedium),
                ),
        ),
        verticalSpace(8),
        Text(
          title,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeightHelper.regular,
            color: labelColor,
          ),
        ),
      ],
    );
  }
}
