import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsListTileItem extends StatelessWidget {
  final String icon;
  final String title;
  final void Function()? onTap;
  final bool isLogout;
  const SettingsListTileItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(
          icon,
          width: 24.w,
          height: 24.h,
        ),
        title: Text(
          title,
          style: isLogout
              ? TextStyles.font14RedRegular
              : TextStyles.font14DarkBlueRegular,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 18.w,
        ),
      ),
    );
  }
}
