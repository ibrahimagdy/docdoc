import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/doctor_details/ui/loading_shimmer/shimmer_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerAboutContent extends StatelessWidget {
  final Animation<double> animation;
  const ShimmerAboutContent({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerBox(
          animation: animation,
          width: 90.w,
          height: 16.h,
          borderRadius: 6.r,
        ),
        verticalSpace(12),
        ShimmerBox(
          animation: animation,
          width: double.infinity,
          height: 13.h,
          borderRadius: 5.r,
        ),
        verticalSpace(8),
        ShimmerBox(
          animation: animation,
          width: double.infinity,
          height: 13.h,
          borderRadius: 5.r,
        ),
        verticalSpace(8),
        ShimmerBox(
          animation: animation,
          width: 200.w,
          height: 13.h,
          borderRadius: 5.r,
        ),
        verticalSpace(24),
        ShimmerBox(
          animation: animation,
          width: 120.w,
          height: 16.h,
          borderRadius: 6.r,
        ),
        verticalSpace(12),
        ShimmerBox(
          animation: animation,
          width: double.infinity,
          height: 13.h,
          borderRadius: 5.r,
        ),
        verticalSpace(24),
        ShimmerBox(
          animation: animation,
          width: 100.w,
          height: 16.h,
          borderRadius: 6.r,
        ),
        verticalSpace(12),
        ShimmerBox(
          animation: animation,
          width: 80.w,
          height: 13.h,
          borderRadius: 5.r,
        ),
        verticalSpace(24),
        ShimmerBox(
          animation: animation,
          width: 70.w,
          height: 16.h,
          borderRadius: 6.r,
        ),
        verticalSpace(12),
        ShimmerBox(
          animation: animation,
          width: 160.w,
          height: 13.h,
          borderRadius: 5.r,
        ),
      ],
    );
  }
}
