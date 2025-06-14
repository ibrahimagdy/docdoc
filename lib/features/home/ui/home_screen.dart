import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/home/ui/widgets/doctor_blue_container.dart';
import 'package:doctors_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:doctors_app/features/home/ui/widgets/see_all_widget.dart';
import 'package:doctors_app/features/home/ui/widgets/speciality_and_doctors_bloc_builder.dart';
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
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: HomeTopBar()),
              const SliverToBoxAdapter(child: DoctorBlueContainer()),
              SliverToBoxAdapter(child: verticalSpace(24)),
              SliverToBoxAdapter(
                child: SeeAllWidget(
                  text: "Doctor Speciality",
                  onTap: () {},
                ),
              ),
              SliverToBoxAdapter(child: verticalSpace(16)),
              const SpecialityAndDoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}