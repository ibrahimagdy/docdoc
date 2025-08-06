import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChangeProfilePic extends StatelessWidget {
  const ChangeProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/profile_pic.png',
            height: 132.h,
            width: 132.w,
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
    );
  }
}
