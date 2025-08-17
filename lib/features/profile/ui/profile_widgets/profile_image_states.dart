import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageStates extends StatelessWidget {
  final String? profileImageUrl;
  final bool isLoading;

  const ProfileImageStates({
    super.key,
    this.profileImageUrl,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {

    if (isLoading && profileImageUrl != null && profileImageUrl!.isNotEmpty) {
      return Container(
        width: 132.w,
        height: 132.h,
        color: ColorManger.greyContainer,
        child: const LoadingCircleIndicator(),
      );
    }

    if (profileImageUrl != null && profileImageUrl!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: profileImageUrl!,
        width: 132.w,
        height: 132.h,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: 132.w,
          height: 132.h,
          color: ColorManger.greyContainer,
          child: const LoadingCircleIndicator(),
        ),
        errorWidget: (context, url, error) => Image.asset(
          'assets/images/profile_pic.png',
          height: 132.h,
          width: 132.w,
          fit: BoxFit.cover,
        ),
      );
    }

    return isLoading
        ? Container(
      width: 132.w,
      height: 132.h,
      color: ColorManger.greyContainer,
      child: const LoadingCircleIndicator(),
    )
        : Image.asset(
      'assets/images/profile_pic.png',
      height: 132.h,
      width: 132.w,
      fit: BoxFit.cover,
    );
  }
}
