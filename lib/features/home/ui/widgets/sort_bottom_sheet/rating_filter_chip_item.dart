import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingFilterChipItem extends StatelessWidget {
  final String label;
  final double? rating; // null means "All"
  final bool isSelected;
  final VoidCallback onTap;

  const RatingFilterChipItem({
    super.key,
    required this.label,
    required this.rating,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color:
              isSelected ? ColorManger.mainBlue : ColorManger.lightBackground,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              color: isSelected ? ColorManger.white : ColorManger.greyDivider,
              size: 20.sp,
            ),
            horizontalSpace(4),
            Text(
              label,
              style: isSelected
                  ? TextStyles.font14WhiteRegular
                  : TextStyles.font14GreyRegular,
            ),
          ],
        ),
      ),
    );
  }
}
