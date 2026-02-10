import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileListTileItem extends StatelessWidget {
  final String icon;
  final String title;
  final void Function()? onTap;

  const ProfileListTileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(icon),
        title: Text(
          title,
          style: TextStyles.font14DarkBlueRegular,
        ),
      ),
    );
  }
}
