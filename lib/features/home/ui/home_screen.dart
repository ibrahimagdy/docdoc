import 'package:doctors_app/features/home/ui/widgets/doctor_blue_container.dart';
import 'package:doctors_app/features/home/ui/widgets/home_top_bar.dart';
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
          child: const SingleChildScrollView(
            child: Column(
              children: [
                HomeTopBar(),
                DoctorBlueContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
