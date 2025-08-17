import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/profile/ui/profile_widgets/change_profile_pic_option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeProfilePicBottomSheet {
  static void show(
    BuildContext context, {
    VoidCallback? onGalleryTap,
    VoidCallback? onCameraTap,
  }) {
    showModalBottomSheet(
      backgroundColor: ColorManger.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpace(8),
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: ColorManger.greyDivider,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            verticalSpace(20),
            Text(
              'Choose a profile picture',
              style: TextStyles.font18DarkBlueBold,
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (onGalleryTap != null)
                  ChangeProfilePicOptionItem(
                    icon: Icons.photo_library,
                    label: 'Gallery',
                    onTap: onGalleryTap,
                  ),
                if (onCameraTap != null)
                  ChangeProfilePicOptionItem(
                    icon: Icons.camera_alt,
                    label: 'Camera',
                    onTap: onCameraTap,
                  ),
              ],
            ),
            verticalSpace(40),
          ],
        );
      },
    );
  }
}
