import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctors_app/core/theming/colors.dart';

class BottomNavItem extends StatelessWidget {
  final String icon;
  final int index;
  final int selectedIndex;
  final VoidCallback onTap;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            selectedIndex == index ? ColorManger.mainBlue : ColorManger.black,
            BlendMode.srcIn,
          ),
          width: 24.w,
          height: 24.h,
        ),
      ),
    );
  }
}
