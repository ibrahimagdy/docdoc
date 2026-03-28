import 'package:doctors_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectionCircle extends StatelessWidget {
  final bool isSelected;
  final double? size;
  final double? innerSize;
  final Color? borderColor;
  final Color? fillColor;

  const SelectionCircle({
    super.key,
    required this.isSelected,
    this.size,
    this.innerSize,
    this.borderColor,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size?.w ?? 20.w,
      height: size?.w ?? 20.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? (fillColor ?? ColorManger.mainBlue)
              : (borderColor ?? ColorManger.mainBlue.withValues(alpha: 0.4)),
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: innerSize?.w ?? 10.w,
                height: innerSize?.w ?? 10.w,
                decoration: BoxDecoration(
                  color: fillColor ?? ColorManger.mainBlue,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : null,
    );
  }
}
