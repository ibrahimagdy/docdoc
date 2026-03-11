import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewRatingStars extends StatelessWidget {
  final int rate;

  const ReviewRatingStars({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          index < rate ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 20.sp,
        ),
      ),
    );
  }
}
