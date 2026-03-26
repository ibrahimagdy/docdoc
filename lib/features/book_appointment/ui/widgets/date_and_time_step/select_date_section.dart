import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/book_appointment/ui/widgets/date_and_time_step/date_picker_carousel.dart';
import 'package:flutter/material.dart';

class SelectDateSection extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;

  const SelectDateSection({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Date',
          style: TextStyles.font16DarkBlueSemiBold,
        ),
        verticalSpace(24),
        DatePickerCarousel(
          selectedDate: selectedDate,
          onDateSelected: onDateSelected,
        ),
      ],
    );
  }
}
