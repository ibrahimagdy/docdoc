import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:doctors_app/features/home/data/models/recommendation_doctors_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorMapBottomSheet extends StatelessWidget {
  final DoctorData doctor;

  const DoctorMapBottomSheet({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          context.pushNamed(
            Routes.doctorDetailsScreen,
            arguments: doctor.id,
          );
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl: doctor.profileImage,
                width: 80.w,
                height: 80.h,
                fit: BoxFit.cover,
                placeholder: (context, url) => const LoadingCircleIndicator(),
                errorWidget: (context, url, error) => Container(
                  width: 80.w,
                  height: 80.h,
                  color: ColorManger.lighterGrey,
                  child: Icon(
                    Icons.person,
                    size: 40.sp,
                    color: ColorManger.grey,
                  ),
                ),
              ),
            ),
            horizontalSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    doctor.fullName,
                    style: TextStyles.font16DarkBlueBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(8),
                  Text(
                    '${doctor.specializationName} | ${doctor.address}',
                    style: TextStyles.font12GreyRegular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(12),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svgs/star.svg",
                        width: 16.w,
                        height: 16.h,
                      ),
                      horizontalSpace(4),
                      Text(
                        '${doctor.rate}',
                        style: TextStyles.font12GreyRegular,
                      ),
                      horizontalSpace(4),
                      Text(
                        '(${doctor.reviewsCount} reviews)',
                        style: TextStyles.font12GreyRegular,
                      ),
                    ],
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
