import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/features/profile/logic/profile_cubit.dart';
import 'package:doctors_app/features/profile/ui/widgets/change_profile_avatar.dart';
import 'package:doctors_app/features/profile/ui/widgets/profile_app_bar.dart';
import 'package:doctors_app/features/profile/ui/widgets/profile_list_tiles.dart';
import 'package:doctors_app/features/profile/ui/widgets/profile_name_and_email.dart';
import 'package:doctors_app/features/profile/ui/widgets/profile_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.mainBlue,
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(4),
            const ProfileAppBar(),
            verticalSpace(92),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorManger.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r),
                      ),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                children: [
                                  verticalSpace(84),
                                  const ProfileNameAndEmail(),
                                  verticalSpace(24),
                                  const ProfileTabs(),
                                  verticalSpace(24),
                                  const ProfileListTiles(),
                                  const Spacer(),
                                  verticalSpace(20),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ChangeProfileAvatar(
                    whiteRadius: 67,
                    avatarRadius: 66,
                    onTap: () {
                      final profileCubit = context.read<ProfileCubit>();
                      context.pushNamed(
                        Routes.personalInfoScreen,
                        arguments: profileCubit,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
