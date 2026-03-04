import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/home/data/models/specializations_response.dart';
import 'package:doctors_app/features/home/ui/widgets/sort_bottom_sheet/filter_chip_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityFilterList extends StatelessWidget {
  final List<SpecializationData> specializations;
  final String? selectedSpeciality;
  final Function(String?) onSpecialityChanged;

  const SpecialityFilterList({
    super.key,
    required this.specializations,
    required this.selectedSpeciality,
    required this.onSpecialityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: specializations.length + 1, // +1 for "All"
        separatorBuilder: (context, index) => horizontalSpace(12),
        itemBuilder: (context, index) {
          // First item is "All"
          if (index == 0) {
            return FilterChipItem(
              label: 'All',
              isSelected: selectedSpeciality == null,
              onTap: () => onSpecialityChanged(null),
            );
          }

          // Specializations from API
          final specialization = specializations[index - 1];
          return FilterChipItem(
            label: specialization.name,
            isSelected: selectedSpeciality == specialization.name,
            onTap: () => onSpecialityChanged(specialization.name),
          );
        },
      ),
    );
  }
}
