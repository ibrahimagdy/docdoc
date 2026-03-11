import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/doctor_details/ui/loading_shimmer/shimmer_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerDoctorInfo extends StatelessWidget {
  final Animation<double> animation;
  const ShimmerDoctorInfo({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShimmerBox(
          animation: animation,
          width: 74.w,
          height: 74.h,
          borderRadius: 12.r,
        ),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerBox(
                animation: animation,
                width: 150.w,
                height: 16.h,
                borderRadius: 6.r,
              ),
              verticalSpace(10),
              ShimmerBox(
                animation: animation,
                width: 180.w,
                height: 12.h,
                borderRadius: 6.r,
              ),
              verticalSpace(10),
              Row(
                children: [
                  ShimmerBox(
                    animation: animation,
                    width: 16.w,
                    height: 16.h,
                    borderRadius: 4.r,
                  ),
                  horizontalSpace(6),
                  ShimmerBox(
                    animation: animation,
                    width: 100.w,
                    height: 12.h,
                    borderRadius: 6.r,
                  ),
                ],
              ),
            ],
          ),
        ),
        ShimmerBox(
          animation: animation,
          width: 24.w,
          height: 24.h,
          borderRadius: 6.r,
        ),
      ],
    );
  }
}
