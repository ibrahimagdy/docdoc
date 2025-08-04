import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileListTileItem extends StatelessWidget {
  final String icon;
  final String title;

  const ProfileListTileItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(icon),
      title: Text(
        title,
        style: TextStyles.font14DarkBlueRegular,
      ),
    );
  }
}
