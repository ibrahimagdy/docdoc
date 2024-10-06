import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final bool? isObscureText;
  final Function(String?) validator;
  final TextEditingController? controller;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    required this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.backgroundColor,
    this.isObscureText,
    required this.validator,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        enabledBorder: enabledBorder ??
            buildOutlineInputBorder(color: ColorManger.lighterGrey),
        focusedBorder: focusedBorder ??
            buildOutlineInputBorder(color: ColorManger.mainBlue),
        errorBorder: buildOutlineInputBorder(color: Colors.red),
        focusedErrorBorder: buildOutlineInputBorder(color: Colors.red),
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font14GreyMedium,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: backgroundColor ?? ColorManger.lightestGrey,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
      validator: (value){
        return validator(value);
      },
      controller: controller,
    );
  }

  OutlineInputBorder buildOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: color,
        width: 1.3,
      ),
    );
  }
}
