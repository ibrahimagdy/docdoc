import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/widgets/custom_app_bar.dart';
import 'package:doctors_app/features/home/ui/widgets/doctor_speciality/doctor_speciality_grid_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeAllDoctorSpecialityScreen extends StatelessWidget {
  const SeeAllDoctorSpecialityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(16),
                const CustomAppBar(
                  title: "Doctor Speciality",
                ),
                verticalSpace(42),
                const DoctorSpecialityGridBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
