import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSlotItem extends StatelessWidget {
  final String time;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeSlotItem({
    super.key,
    required this.time,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final itemWidth = (MediaQuery.of(context).size.width - 64.w) / 2;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 49.h,
        width: itemWidth,
        decoration: BoxDecoration(
          color:
              isSelected ? ColorManger.mainBlue : ColorManger.lightBackground,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Center(
          child: Text(
            time,
            style: TextStyles.font14DarkBlueMedium.copyWith(
              color: isSelected ? ColorManger.white : ColorManger.moreLightGrey,
            ),
          ),
        ),
      ),
    );
  }
}
