import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/doctor_details/ui/loading_shimmer/shimmer_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerReviewItem extends StatelessWidget {
  final Animation<double> animation;

  const ShimmerReviewItem({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerBox(
            animation: animation,
            width: 40.w,
            height: 40.h,
            borderRadius: 35.r,
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(
                  animation: animation,
                  width: 130.w,
                  height: 14.h,
                  borderRadius: 6.r,
                ),
                verticalSpace(8),
                Row(
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: ShimmerBox(
                        animation: animation,
                        width: 18.w,
                        height: 18.h,
                        borderRadius: 4.r,
                      ),
                    );
                  }),
                ),
                verticalSpace(16),
                ShimmerBox(
                  animation: animation,
                  width: double.infinity,
                  height: 12.h,
                  borderRadius: 5.r,
                ),
                verticalSpace(6),
                ShimmerBox(
                  animation: animation,
                  width: double.infinity,
                  height: 12.h,
                  borderRadius: 5.r,
                ),
                verticalSpace(6),
                ShimmerBox(
                  animation: animation,
                  width: 180.w,
                  height: 12.h,
                  borderRadius: 5.r,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
