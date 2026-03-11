import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:doctors_app/features/doctor_details/data/models/reviews_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewProfileImage extends StatelessWidget {
  final ReviewData review;

  const ReviewProfileImage({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35.r),
      child: review.profileImageUrl.isEmpty
          ? Container(
              width: 40.w,
              height: 40.h,
              color: ColorManger.mainBlue,
              child: Center(
                child: Text(
                  review.fullName[0].toUpperCase(),
                  style: TextStyles.font18WhiteSemiBold,
                ),
              ),
            )
          : CachedNetworkImage(
              imageUrl: review.profileImageUrl,
              width: 40.w,
              height: 40.h,
              fit: BoxFit.cover,
              placeholder: (context, url) => const LoadingCircleIndicator(),
              errorWidget: (context, url, error) => Container(
                width: 40.w,
                height: 40.h,
                color: ColorManger.mainBlue,
                child: Center(
                  child: Text(
                    review.fullName[0].toUpperCase(),
                    style: TextStyles.font18WhiteSemiBold,
                  ),
                ),
              ),
            ),
    );
  }
}
