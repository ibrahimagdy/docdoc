import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:doctors_app/features/home/data/models/recommendation_doctors_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorMessageItem extends StatelessWidget {
  final DoctorData doctorData;

  const DoctorMessageItem({
    super.key,
    required this.doctorData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: doctorData.profileImage,
                height: 56.h,
                width: 56.w,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 56.h,
                  width: 56.w,
                  color: ColorManger.greyContainer,
                  child: const LoadingCircleIndicator(),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 56.h,
                  width: 56.w,
                  color: ColorManger.greyContainer,
                  child: Icon(
                    Icons.person,
                    size: 30.sp,
                    color: ColorManger.grey,
                  ),
                ),
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorData.fullName,
                    style: TextStyles.font16DarkBlueBold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  verticalSpace(4),
                  Text(
                    '${doctorData.specializationName} | ${doctorData.address}',
                    style: TextStyles.font12GreyRegular,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
