import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: ColorManger.greyContainer,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'My Appointment',
                style: TextStyles.font12DarkBlueRegular,
              ),
            ),
          ),
          Container(
            width: 1.w,
            height: 42.h,
            color: ColorManger.greyDivider,
          ),
          Expanded(
            child: Center(
              child: Text(
                'Medical records',
                style: TextStyles.font12DarkBlueRegular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
