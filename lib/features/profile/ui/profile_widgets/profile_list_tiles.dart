import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/features/profile/ui/profile_widgets/profile_list_tile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileListTiles extends StatelessWidget {
  const ProfileListTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          ProfileListTileItem(
            icon: 'assets/svgs/personal_info.svg',
            title: 'Personal Information',
            onTap: () {
              context.pushNamed(Routes.personalInfoScreen);
            },
          ),
          verticalSpace(8),
          Divider(
            color: ColorManger.lighterGrey,
            thickness: 1.h,
          ),
          verticalSpace(8),
          ProfileListTileItem(
            icon: 'assets/svgs/test_and_diagnostic.svg',
            title: 'My Test & Diagnostic',
            onTap: () {},
          ),
          verticalSpace(8),
          Divider(
            color: ColorManger.lighterGrey,
            thickness: 1.h,
          ),
          verticalSpace(8),
          ProfileListTileItem(
            icon: 'assets/svgs/payment.svg',
            title: 'Payment',
            onTap: () {},
          ),
          verticalSpace(8),
          Divider(
            color: ColorManger.lighterGrey,
            thickness: 1.h,
          ),
        ],
      ),
    );
  }
}
