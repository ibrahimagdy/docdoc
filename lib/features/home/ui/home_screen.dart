import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/home/ui/widgets/doctor_blue_container.dart';
import 'package:doctors_app/features/home/ui/widgets/doctor_speciality/doctor_speciality_list_view.dart';
import 'package:doctors_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:doctors_app/features/home/ui/widgets/recommendation_doctors/doctors_list_view.dart';
import 'package:doctors_app/features/home/ui/widgets/see_all_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            children: [
              const HomeTopBar(),
              const DoctorBlueContainer(),
              verticalSpace(24),
              SeeAllWidget(
                text: "Doctor Speciality",
                onTap: () {},
              ),
              verticalSpace(16),
              const DoctorSpecialityListView(),
              verticalSpace(23),
              SeeAllWidget(
                text: "Recommendation Doctor",
                onTap: () {},
              ),
              verticalSpace(20),
              const DoctorsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
