import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardSubItem extends StatelessWidget {
  final String svgAsset;
  final String label;

  const CardSubItem({
    super.key,
    required this.svgAsset,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              svgAsset,
              width: 32.w,
              height: 32.h,
              fit: BoxFit.contain,
            ),
            horizontalSpace(8),
            Text(
              label,
              style: TextStyles.font14DarkBlueRegular,
            ),
          ],
        ),
        verticalSpace(12),
        const Divider(
          color: ColorManger.lighterGrey,
          thickness: 1,
        ),
        verticalSpace(12),
      ],
    );
  }
}
