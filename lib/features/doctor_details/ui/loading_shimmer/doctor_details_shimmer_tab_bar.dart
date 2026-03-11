import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/doctor_details/ui/loading_shimmer/shimmer_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerTabBar extends StatelessWidget {
  final Animation<double> animation;
  const ShimmerTabBar({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ShimmerBox(
                animation: animation,
                height: 36.h,
                borderRadius: 8.r,
              ),
            ),
            horizontalSpace(8),
            Expanded(
              child: ShimmerBox(
                animation: animation,
                height: 36.h,
                borderRadius: 8.r,
              ),
            ),
            horizontalSpace(8),
            Expanded(
              child: ShimmerBox(
                animation: animation,
                height: 36.h,
                borderRadius: 8.r,
              ),
            ),
          ],
        ),
        verticalSpace(4),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 2.h,
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            horizontalSpace(8),
            Expanded(child: verticalSpace(2)),
            horizontalSpace(8),
            Expanded(child: verticalSpace(2)),
          ],
        ),
      ],
    );
  }
}
