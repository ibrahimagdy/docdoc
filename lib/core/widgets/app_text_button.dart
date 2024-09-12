import 'package:doctors_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? width;
  final double? height;
  final VoidCallback onPressed;
  final TextStyle textStyle;

  const AppTextButton({
    super.key,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.width,
    this.height,
    required this.text,
    required this.onPressed,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? ColorManger.mainBlue,
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
              horizontal: horizontalPadding?.w ?? 12.w,
              vertical: verticalPadding?.h ?? 14.h,
            ),
          ),
          fixedSize: WidgetStateProperty.all(
            Size(
              width?.w ?? double.maxFinite,
              height?.h ?? 52.h,
            ),
          )),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
