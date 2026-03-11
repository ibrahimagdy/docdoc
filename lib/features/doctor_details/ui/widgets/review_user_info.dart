import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/doctor_details/data/models/reviews_response.dart';
import 'package:doctors_app/features/doctor_details/ui/widgets/review_rating_stars.dart';
import 'package:flutter/material.dart';

class ReviewUserInfo extends StatelessWidget {
  final ReviewData review;

  const ReviewUserInfo({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          review.fullName,
          style: TextStyles.font16DarkBlueSemiBold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        verticalSpace(8),
        ReviewRatingStars(rate: review.rate),
        verticalSpace(16),
        Text(
          review.comment,
          style: TextStyles.font12GreyRegular,
        ),
      ],
    );
  }
}
