import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/doctor_details/ui/loading_shimmer/shimmer_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsShimmerAppBar extends StatelessWidget {
  final Animation<double> animation;
  const DoctorDetailsShimmerAppBar({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShimmerBox(
          animation: animation,
          width: 36.w,
          height: 36.h,
          borderRadius: 10.r,
        ),
        const Spacer(),
        ShimmerBox(
          animation: animation,
          width: 140.w,
          height: 18.h,
          borderRadius: 6.r,
        ),
        const Spacer(),
        horizontalSpace(36),
      ],
    );
  }
}
