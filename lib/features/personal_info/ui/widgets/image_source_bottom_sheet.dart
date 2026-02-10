import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSourceBottomSheet extends StatelessWidget {
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;
  final VoidCallback onDeleteTap;

  const ImageSourceBottomSheet({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          verticalSpace(20),
          Text(
            'Change Profile Picture',
            style: TextStyles.font20BlackSemiBold,
          ),
          verticalSpace(20),
          _buildOption(
            icon: Icons.camera_alt,
            title: 'Take Photo',
            onTap: () {
              Navigator.pop(context);
              onCameraTap();
            },
          ),
          verticalSpace(12),
          _buildOption(
            icon: Icons.photo_library,
            title: 'Choose from Gallery',
            onTap: () {
              Navigator.pop(context);
              onGalleryTap();
            },
          ),
          verticalSpace(12),
          _buildOption(
            icon: Icons.delete,
            title: 'Remove Photo',
            onTap: () {
              Navigator.pop(context);
              onDeleteTap();
            },
            isDestructive: true,
          ),
          verticalSpace(20),
        ],
      ),
    );
  }

  Widget _buildOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        decoration: BoxDecoration(
          border: Border.all(color: ColorManger.lighterGrey),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isDestructive ? Colors.red : ColorManger.mainBlue,
              size: 24.sp,
            ),
            horizontalSpace(16),
            Text(
              title,
              style: TextStyles.font14DarkBlueRegular.copyWith(
                color: isDestructive ? Colors.red : ColorManger.darkBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
