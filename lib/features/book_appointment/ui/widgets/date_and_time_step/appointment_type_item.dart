import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppointmentTypeItem extends StatelessWidget {
  final String svgAsset;
  final Color iconBackground;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const AppointmentTypeItem({
    super.key,
    required this.svgAsset,
    required this.iconBackground,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: SvgPicture.asset(
                  svgAsset,
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
              horizontalSpace(13),
              Expanded(
                child: Text(
                  label,
                  style: TextStyles.font14DarkBlueRegular,
                ),
              ),
              Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorManger.mainBlue.withValues(alpha: 0.4),
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: const BoxDecoration(
                            color: ColorManger.mainBlue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
          verticalSpace(16),
          const Divider(
            color: ColorManger.lighterGrey,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
