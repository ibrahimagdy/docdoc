import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'profile_image_states.dart';

class ChangeProfilePic extends StatelessWidget {
  final String? profileImageUrl;
  final bool isLoading;
  final VoidCallback? onTap;

  const ChangeProfilePic({
    super.key,
    this.profileImageUrl,
    this.isLoading = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            ClipOval(
              child: ProfileImageStates(
                isLoading: isLoading,
                profileImageUrl: profileImageUrl,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 8,
              child: SvgPicture.asset(
                'assets/svgs/change_profile_icon.svg',
                width: 30.w,
                height: 30.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
