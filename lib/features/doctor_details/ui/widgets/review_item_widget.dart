import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/doctor_details/data/models/reviews_response.dart';
import 'package:doctors_app/features/doctor_details/ui/widgets/review_profile_image.dart';
import 'package:doctors_app/features/doctor_details/ui/widgets/review_user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewItemWidget extends StatelessWidget {
  final ReviewData review;

  const ReviewItemWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewProfileImage(review: review),
          horizontalSpace(16),
          Expanded(
            child: ReviewUserInfo(review: review),
          ),
        ],
      ),
    );
  }
}
