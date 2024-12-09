import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/home/data/model/specialization_responses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorItem extends StatelessWidget {
  final Doctors? doctors;
  const DoctorItem({super.key, required this.doctors});

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
                  doctors?.name ?? 'Doctor',
                  style: TextStyles.font16DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                verticalSpace(8),
                Text(
                  '${doctors?.degree} | ${doctors?.phone}',
                  style: TextStyles.font12GreyRegular,
                ),
                verticalSpace(8),
                Text(
                  doctors?.email ?? 'Email',
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
