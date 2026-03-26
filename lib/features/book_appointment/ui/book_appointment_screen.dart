import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/widgets/custom_app_bar.dart';
import 'package:doctors_app/features/book_appointment/ui/date_and_time_step.dart';
import 'package:doctors_app/features/book_appointment/ui/widgets/book_appointment/booking_stepper_widget.dart';
import 'package:doctors_app/features/book_appointment/ui/widgets/date_and_time_step/step_with_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  final List<String> _stepTitles = ['Date & Time', 'Payment', 'Summary'];

  // Step 1 validation state
  DateTime? _selectedDate;
  String? _selectedTime;
  String? _selectedAppointmentType;

  bool get _isStep1Valid =>
      _selectedDate != null &&
      _selectedTime != null &&
      _selectedAppointmentType != null;

  void _goToNextPage() {
    if (_currentStep < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void _bookNow() {}

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  verticalSpace(16),
                  const CustomAppBar(title: "Book Appointment"),
                  verticalSpace(32),
                  BookingStepperWidget(
                    currentStep: _currentStep,
                    stepTitles: _stepTitles,
                  ),
                  verticalSpace(41),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() => _currentStep = index);
                },
                children: [
                  StepWithButton(
                    currentStep: _currentStep,
                    totalSteps: _stepTitles.length,
                    onNext: _goToNextPage,
                    onLastStep: _bookNow,
                    isButtonEnabled: _isStep1Valid,
                    child: DateAndTimeStep(
                      onDateChanged: (date) => setState(
                        () => _selectedDate = date,
                      ),
                      onTimeChanged: (time) => setState(
                        () => _selectedTime = time,
                      ),
                      onTypeChanged: (type) => setState(
                        () => _selectedAppointmentType = type,
                      ),
                    ),
                  ),
                  StepWithButton(
                    currentStep: _currentStep,
                    totalSteps: _stepTitles.length,
                    onNext: _goToNextPage,
                    onLastStep: _bookNow,
                    child: const SizedBox(),
                  ),
                  StepWithButton(
                    currentStep: _currentStep,
                    totalSteps: _stepTitles.length,
                    onNext: _goToNextPage,
                    onLastStep: _bookNow,
                    child: const SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
