import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/app_text_button.dart';
import 'package:doctors_app/features/profile/ui/personal_info_widgets/personal_info_app_bar.dart';
import 'package:doctors_app/features/profile/ui/personal_info_widgets/personal_info_bloc_builder.dart';
import 'package:doctors_app/features/profile/ui/profile_widgets/change_profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              const PersonalInfoAppBar(),
              verticalSpace(48),
              const ChangeProfilePic(),
              verticalSpace(46),
              const PersonalInfoBlocBuilder(),
              Text(
                'When you set up your personal information settings, you should take care to provide accurate information.',
                style: TextStyles.font12GreyRegular,
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: AppTextButton(
                  text: 'Save',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
