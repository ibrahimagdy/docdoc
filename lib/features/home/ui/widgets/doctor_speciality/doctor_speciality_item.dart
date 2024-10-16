import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/colors.dart';

class DoctorSpecialityItem extends StatelessWidget {
  const DoctorSpecialityItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 38,
            backgroundColor: ColorManger.lightBlue,
            child: SvgPicture.asset(
              'assets/svgs/general_speciality.svg',
              height: 34.h,
              width: 34.w,
            ),
          ),
          verticalSpace(12),
          Text(
            'General',
            style: TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
