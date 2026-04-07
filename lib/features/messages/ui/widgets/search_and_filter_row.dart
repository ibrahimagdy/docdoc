import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchAndFilterRow extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final VoidCallback onFilterTap;

  const SearchAndFilterRow({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextFormField(
            controller: controller,
            borderRadius: 100.r,
            fillColor: ColorManger.moreLighterGrey,
            hintText: 'Search Message',
            prefixIcon: SvgPicture.asset(
              'assets/svgs/search.svg',
              width: 24.w,
              height: 24.h,
            ),
            onChanged: onChanged,
          ),
        ),
        horizontalSpace(12),
        GestureDetector(
          onTap: onFilterTap,
          child: SvgPicture.asset(
            'assets/svgs/sort.svg',
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}
