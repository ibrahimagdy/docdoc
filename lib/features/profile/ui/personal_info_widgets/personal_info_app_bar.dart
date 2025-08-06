import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoAppBar extends StatelessWidget {
  const PersonalInfoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  'Personal information',
                  style: TextStyles.font18DarkBlueSemiBold,
                ),
              ),
              GestureDetector(
                onTap: () => context.pop(),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: ColorManger.lighterGrey,
                      ),
                    ),
                    child: const Icon(
                      CupertinoIcons.back,
                      color: ColorManger.darkBlue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
