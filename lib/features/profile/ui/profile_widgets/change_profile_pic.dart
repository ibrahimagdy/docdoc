import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChangeProfilePic extends StatelessWidget {
  final String? profileImageUrl;

  const ChangeProfilePic({
    super.key,
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 132.h,
            width: 132.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: ClipOval(
              child: profileImageUrl != null && profileImageUrl!.isNotEmpty
                  ? CachedNetworkImage(
                imageUrl: profileImageUrl!,
                width: 132.w,
                height: 132.h,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 132.w,
                  height: 132.h,
                  color: Colors.grey.shade200,
                  child: const LoadingCircleIndicator(),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/profile_pic.png',
                  height: 132.h,
                  width: 132.w,
                  fit: BoxFit.cover,
                ),
              )
                  : Image.asset(
                'assets/images/profile_pic.png',
                height: 132.h,
                width: 132.w,
                fit: BoxFit.cover,
              ),
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
    );
  }
}