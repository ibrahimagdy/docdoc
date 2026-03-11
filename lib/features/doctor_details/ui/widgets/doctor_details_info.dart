import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:doctors_app/features/doctor_details/data/models/doctor_details_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorDetailsInfo extends StatelessWidget {
  final DoctorDetailsData doctorDetails;

  const DoctorDetailsInfo({super.key, required this.doctorDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: doctorDetails.profileImage,
              height: 74.h,
              width: 74.w,
              fit: BoxFit.cover,
              placeholder: (context, url) => const LoadingCircleIndicator(),
              errorWidget: (context, url, error) => Container(
                height: 74.h,
                width: 74.w,
                color: Colors.grey[300],
                child: const Icon(Icons.person, size: 50),
              ),
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorDetails.fullName,
                  style: TextStyles.font16DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                verticalSpace(8),
                Text(
                  '${doctorDetails.specializationName} | ${doctorDetails.address}',
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
                      '${doctorDetails.rate.toStringAsFixed(1)} (${doctorDetails.reviewsCount} reviews)',
                      style: TextStyles.font12GreyRegular,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            'assets/svgs/message.svg',
            width: 24.w,
            height: 24.h,
          )
        ],
      ),
    );
  }
}
