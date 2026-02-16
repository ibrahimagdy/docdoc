import 'package:doctors_app/features/home/data/models/specializations_response.dart';
import 'package:doctors_app/features/home/ui/widgets/doctor_speciality/doctor_speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityGridView extends StatelessWidget {
  final List<SpecializationData> specializations;
  final double spacing;
  const DoctorSpecialityGridView({
    super.key,
    required this.specializations,
    this.spacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: spacing.w,
        mainAxisSpacing: spacing.h,
        childAspectRatio: 0.8,
      ),
      itemCount: specializations.length,
      itemBuilder: (context, index) {
        return DoctorSpecialityItem(
          specializationData: specializations[index],
          isGridView: true,
        );
      },
    );
  }
}
