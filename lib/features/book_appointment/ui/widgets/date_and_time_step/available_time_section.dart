import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/book_appointment/ui/widgets/date_and_time_step/time_slot_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableTimeSection extends StatelessWidget {
  final String? selectedTime;
  final Function(String) onTimeSelected;

  const AvailableTimeSection({
    super.key,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  // Mock data - will be replaced with API data
  List<String> get _availableTimeSlots => [
        '08.00 AM',
        '08.30 AM',
        '09.00 AM',
        '09.30 AM',
        '10.00 AM',
        '11.00 AM',
      ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available time',
          style: TextStyles.font16DarkBlueSemiBold,
        ),
        verticalSpace(24),
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: _availableTimeSlots.map((time) {
            return TimeSlotItem(
              time: time,
              isSelected: selectedTime == time,
              onTap: () => onTimeSelected(time),
            );
          }).toList(),
        ),
      ],
    );
  }
}
