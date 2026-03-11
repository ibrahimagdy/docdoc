import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:doctors_app/features/home/data/models/recommendation_doctors_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorItem extends StatelessWidget {
  final DoctorData doctorData;

  const DoctorItem({
    super.key,
    required this.doctorData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.doctorDetailsScreen,
          arguments: doctorData.id,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl: doctorData.profileImage,
                height: 110.h,
                width: 110.w,
                fit: BoxFit.cover,
                placeholder: (context, url) => const LoadingCircleIndicator(),
                errorWidget: (context, url, error) => Container(
                  height: 110.h,
                  width: 110.w,
                  color: Colors.grey[300],
                  child: const Icon(Icons.person, size: 50),
                ),
              ),
            ),
            horizontalSpace(16),
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
                  verticalSpace(8),
                  Text(
                    '${doctorData.specializationName} | ${doctorData.address}',
                    style: TextStyles.font12GreyRegular,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      SvgPicture.asset('assets/svgs/star.svg'),
                      horizontalSpace(4),
                      Text(
                        '${doctorData.rate.toStringAsFixed(1)} (${doctorData.reviewsCount} reviews)',
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
