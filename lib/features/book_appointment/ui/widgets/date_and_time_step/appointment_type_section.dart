import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/book_appointment/ui/widgets/date_and_time_step/appointment_type_item.dart';
import 'package:flutter/material.dart';

class AppointmentTypeSection extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeSelected;

  const AppointmentTypeSection({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Appointment Type',
          style: TextStyles.font16DarkBlueSemiBold,
        ),
        verticalSpace(24),
        AppointmentTypeItem(
          svgAsset: 'assets/svgs/in_person.svg',
          iconBackground: const Color(0xFFEAF2FF),
          label: 'In Person',
          isSelected: selectedType == 'In Person',
          onTap: () => onTypeSelected('In Person'),
        ),
        verticalSpace(16),
        AppointmentTypeItem(
          svgAsset: 'assets/svgs/video.svg',
          iconBackground: const Color(0xFFE9FAEF),
          label: 'Video Call',
          isSelected: selectedType == 'Video Call',
          onTap: () => onTypeSelected('Video Call'),
        ),
        verticalSpace(16),
        AppointmentTypeItem(
          svgAsset: 'assets/svgs/call.svg',
          iconBackground: const Color(0xFFFFEBEB),
          label: 'Phone Call',
          isSelected: selectedType == 'Phone Call',
          onTap: () => onTypeSelected('Phone Call'),
        ),
      ],
    );
  }
}
