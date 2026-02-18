import 'package:doctors_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EndAppBarWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;

  const EndAppBarWidget({super.key, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          border: Border.all(color: ColorManger.lighterGrey),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(
          icon,
          color: ColorManger.darkBlue,
          size: 20.w,
        ),
      ),
    );
  }
}
