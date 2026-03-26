import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/font_weight.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DateItem extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;

  const DateItem({
    super.key,
    required this.date,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: isSelected ? 55.w : 43.w,
          height: isSelected ? 62.h : 48.h,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:
                isSelected ? ColorManger.mainBlue : ColorManger.lightBackground,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat('EEE').format(date).substring(0, 3),
                style: isSelected
                    ? TextStyles.font14WhiteRegular.copyWith(
                        fontWeight: FontWeightHelper.semiBold,
                      )
                    : TextStyles.font12GreyRegular.copyWith(
                        color: ColorManger.moreLightGrey,
                      ),
              ),
              verticalSpace(2),
              Text(
                DateFormat('dd').format(date),
                style: isSelected
                    ? TextStyles.font14WhiteRegular.copyWith(
                        fontWeight: FontWeightHelper.semiBold,
                      )
                    : TextStyles.font12GreyRegular.copyWith(
                        color: ColorManger.moreLightGrey,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
