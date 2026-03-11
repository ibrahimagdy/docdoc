import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/doctor_details/ui/loading_shimmer/doctor_details_shimmer_app_bar.dart';
import 'package:doctors_app/features/doctor_details/ui/loading_shimmer/doctor_details_shimmer_tab_bar.dart';
import 'package:doctors_app/features/doctor_details/ui/loading_shimmer/shimmer_about_content.dart';
import 'package:doctors_app/features/doctor_details/ui/loading_shimmer/shimmer_box.dart';
import 'package:doctors_app/features/doctor_details/ui/loading_shimmer/shimmer_doctor_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsShimmer extends StatefulWidget {
  const DoctorDetailsShimmer({super.key});

  @override
  State<DoctorDetailsShimmer> createState() => _DoctorDetailsShimmerState();
}

class _DoctorDetailsShimmerState extends State<DoctorDetailsShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _animation = Tween<double>(begin: -1.5, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),
              DoctorDetailsShimmerAppBar(animation: _animation),
              verticalSpace(32),
              ShimmerDoctorInfo(animation: _animation),
              verticalSpace(24),
              ShimmerTabBar(animation: _animation),
              verticalSpace(32),
              ShimmerAboutContent(animation: _animation),
              const Spacer(),
              ShimmerBox(
                animation: _animation,
                width: double.infinity,
                height: 52.h,
                borderRadius: 16.r,
              ),
              verticalSpace(16),
            ],
          ),
        );
      },
    );
  }
}
