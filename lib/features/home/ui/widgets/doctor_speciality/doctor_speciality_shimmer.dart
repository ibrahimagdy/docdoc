import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DoctorSpecialityShimmer extends StatelessWidget {
  const DoctorSpecialityShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: ColorManger.lightBlue,
                  highlightColor: ColorManger.lightBlue,
                  child: CircleAvatar(
                    radius: 38.r,
                    backgroundColor: ColorManger.lightBlue,
                  ),
                ),
                verticalSpace(12),
                Shimmer.fromColors(
                  baseColor: ColorManger.lightBlue,
                  highlightColor: ColorManger.lightBlue,
                  child: Container(
                    width: 60.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                      color: ColorManger.lightBlue,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
