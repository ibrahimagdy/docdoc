import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/features/personal_info/logic/personal_info_cubit.dart';
import 'package:doctors_app/features/profile/logic/profile_cubit.dart';
import 'package:doctors_app/features/profile/logic/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChangeProfileAvatar extends StatelessWidget {
  final double whiteRadius;
  final double avatarRadius;
  final VoidCallback? onTap;
  final bool usePositioned;

  const ChangeProfileAvatar({
    super.key,
    required this.whiteRadius,
    required this.avatarRadius,
    this.onTap,
    this.usePositioned = true,
  });

  @override
  Widget build(BuildContext context) {
    final avatarWidget = GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: whiteRadius.r,
                  backgroundColor: ColorManger.white,
                  child: _buildAvatarImage(context, state),
                ),
                Positioned(
                  bottom: 10.h,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/svgs/change_profile_icon.svg',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );

    if (usePositioned) {
      return Positioned(
        top: -60.h,
        left: 0,
        right: 0,
        child: avatarWidget,
      );
    }

    return avatarWidget;
  }

  Widget _buildAvatarImage(BuildContext context, ProfileState state) {
    try {
      final personalInfoCubit = context.read<PersonalInfoCubit>();

      if (personalInfoCubit.selectedImage != null) {
        return CircleAvatar(
          radius: avatarRadius.r,
          backgroundImage: FileImage(personalInfoCubit.selectedImage!),
        );
      }

      if (personalInfoCubit.currentImageUrl == null) {
        return _buildDefaultAvatar();
      }
    } catch (e) {}

    return state.maybeWhen(
      success: (profileData) {
        final imageUrl = profileData.userData.profileImage;

        if (imageUrl.isEmpty) {
          return _buildDefaultAvatar();
        }

        return CircleAvatar(
          radius: avatarRadius.r,
          backgroundImage: CachedNetworkImageProvider(imageUrl),
        );
      },
      orElse: () => _buildDefaultAvatar(),
    );
  }

  Widget _buildDefaultAvatar() {
    return CircleAvatar(
      radius: avatarRadius.r,
      backgroundImage: const AssetImage(
        'assets/images/profile_pic.png',
      ),
    );
  }
}
