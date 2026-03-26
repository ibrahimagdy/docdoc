import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/book_appointment/ui/widgets/date_and_time_step/appointment_type_section.dart';
import 'package:doctors_app/features/book_appointment/ui/widgets/date_and_time_step/available_time_section.dart';
import 'package:doctors_app/features/book_appointment/ui/widgets/date_and_time_step/select_date_section.dart';
import 'package:flutter/material.dart';

class DateAndTimeStep extends StatefulWidget {
  final Function(DateTime)? onDateChanged;
  final Function(String)? onTimeChanged;
  final Function(String)? onTypeChanged;

  const DateAndTimeStep({
    super.key,
    this.onDateChanged,
    this.onTimeChanged,
    this.onTypeChanged,
  });

  @override
  State<DateAndTimeStep> createState() => _DateAndTimeStepState();
}

class _DateAndTimeStepState extends State<DateAndTimeStep> {
  DateTime? selectedDate;
  String? selectedTime;
  String? selectedAppointmentType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectDateSection(
          selectedDate: selectedDate,
          onDateSelected: (date) {
            setState(() => selectedDate = date);
            widget.onDateChanged?.call(date);
          },
        ),
        verticalSpace(24),
        AvailableTimeSection(
          selectedTime: selectedTime,
          onTimeSelected: (time) {
            setState(() => selectedTime = time);
            widget.onTimeChanged?.call(time);
          },
        ),
        verticalSpace(24),
        AppointmentTypeSection(
          selectedType: selectedAppointmentType ?? '',
          onTypeSelected: (type) {
            setState(() => selectedAppointmentType = type);
            widget.onTypeChanged?.call(type);
          },
        ),
        verticalSpace(24),
      ],
    );
  }
}
