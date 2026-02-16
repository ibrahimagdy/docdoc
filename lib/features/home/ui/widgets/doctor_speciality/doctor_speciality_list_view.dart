import 'package:doctors_app/features/home/data/models/specializations_response.dart';
import 'package:doctors_app/features/home/ui/widgets/doctor_speciality/doctor_speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatelessWidget {
  final List<SpecializationData> specializationsList;

  const DoctorSpecialityListView({
    super.key,
    required this.specializationsList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsList.length,
        itemBuilder: (context, index) {
          return DoctorSpecialityItem(
            specializationData: specializationsList[index],
          );
        },
      ),
    );
  }
}
