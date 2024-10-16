import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        children: [
          Image.asset(
            'assets/images/doctor.png',
            height: 110.h,
            width: 110.w,
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Randy Wigham',
                  style: TextStyles.font16DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                verticalSpace(8),
                Text(
                  'General | RSUD Gatot Subroto',
                  style: TextStyles.font12GreyRegular,
                ),
                verticalSpace(8),
                Text(
                  'Email@gmail.com',
                  style: TextStyles.font12GreyRegular,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
