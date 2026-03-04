import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/home/ui/widgets/sort_bottom_sheet/rating_filter_chip_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingFilterList extends StatelessWidget {
  final double? selectedRating;
  final Function(double?) onRatingChanged;

  const RatingFilterList({
    super.key,
    required this.selectedRating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<double> ratings = [5, 4, 3, 2, 1];

    return SizedBox(
      height: 48.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: ratings.length + 1, // +1 for "All"
        separatorBuilder: (context, index) => horizontalSpace(12),
        itemBuilder: (context, index) {
          // First item is "All"
          if (index == 0) {
            return RatingFilterChipItem(
              label: 'All',
              rating: null,
              isSelected: selectedRating == null,
              onTap: () => onRatingChanged(null),
            );
          }

          // Rating options
          final rating = ratings[index - 1];
          return RatingFilterChipItem(
            label: rating.toString(),
            rating: rating,
            isSelected: selectedRating == rating,
            onTap: () => onRatingChanged(rating),
          );
        },
      ),
    );
  }
}
