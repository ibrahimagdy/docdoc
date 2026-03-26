import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/features/book_appointment/ui/widgets/book_appointment/step_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingStepperWidget extends StatelessWidget {
  final int currentStep;
  final List<String> stepTitles;

  const BookingStepperWidget({
    super.key,
    required this.currentStep,
    required this.stepTitles,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        children: List.generate(stepTitles.length * 2 - 1, (index) {
          if (index.isOdd) {
            final stepIndex = index ~/ 2;
            final isCompleted = currentStep > stepIndex;
            return Expanded(
              child: AnimatedContainer(
                margin: EdgeInsets.only(
                  bottom: 10.h,
                  left: 8.w,
                  right: 8.w,
                ),
                duration: const Duration(milliseconds: 300),
                height: 2.h,
                color:
                    isCompleted ? ColorManger.green : ColorManger.moreLightGrey,
              ),
            );
          }

          final stepIndex = index ~/ 2;
          final isCompleted = currentStep > stepIndex;
          final isActive = currentStep == stepIndex;

          return StepCircle(
            stepNumber: stepIndex + 1,
            title: stepTitles[stepIndex],
            isCompleted: isCompleted,
            isActive: isActive,
          );
        }),
      ),
    );
  }
}
