import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/features/settings/ui/widgets/settings_list_tile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsListTiles extends StatelessWidget {
  const SettingsListTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          SettingsListTileItem(
            icon: 'assets/svgs/notification_icon.svg',
            title: 'Notifications',
            onTap: () {},
          ),
          Divider(
            color: ColorManger.lighterGrey,
            thickness: 1.h,
          ),
          verticalSpace(12),
          SettingsListTileItem(
            icon: 'assets/svgs/faq_icon.svg',
            title: 'FAQ',
            onTap: () {},
          ),
          Divider(
            color: ColorManger.lighterGrey,
            thickness: 1.h,
          ),
          verticalSpace(12),
          SettingsListTileItem(
            icon: 'assets/svgs/security_icon.svg',
            title: 'Security',
            onTap: () {},
          ),
          Divider(
            color: ColorManger.lighterGrey,
            thickness: 1.h,
          ),
          verticalSpace(12),
          SettingsListTileItem(
            icon: 'assets/svgs/language_icon.svg',
            title: 'Language',
            onTap: () {},
          ),
          Divider(
            color: ColorManger.lighterGrey,
            thickness: 1.h,
          ),
          verticalSpace(12),
          SettingsListTileItem(
            icon: 'assets/svgs/logout_icon.svg',
            title: 'Logout',
            isLogout: true,
            onTap: () {
              context.pushNamedAndRemoveUntil(
                Routes.loginScreen,
                predicate: (Route<dynamic> route) => false,
              );
            },
          ),
          Divider(
            color: ColorManger.lighterGrey,
            thickness: 1.h,
          ),
          verticalSpace(12),
        ],
      ),
    );
  }
}
