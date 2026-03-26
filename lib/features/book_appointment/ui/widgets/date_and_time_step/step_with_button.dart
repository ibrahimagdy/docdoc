import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepWithButton extends StatelessWidget {
  final Widget child;
  final int currentStep;
  final int totalSteps;
  final VoidCallback onNext;
  final VoidCallback onLastStep;
  final bool isButtonEnabled;

  const StepWithButton({
    super.key,
    required this.child,
    required this.currentStep,
    required this.totalSteps,
    required this.onNext,
    required this.onLastStep,
    this.isButtonEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final isLastStep = currentStep == totalSteps - 1;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          child,
          AppTextButton(
            text: isLastStep ? "Book Now" : "Continue",
            onPressed:
                isButtonEnabled ? (isLastStep ? onLastStep : onNext) : null,
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
