import 'package:doctors_app/core/di/dependency_injection.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/features/home/logic/doctor_speciality/specializations_cubit.dart';
import 'package:doctors_app/features/home/logic/recommendation_doctors/recommendation_doctors_cubit.dart';
import 'package:doctors_app/features/messages/ui/widgets/create_new_message_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CreateNewMessage extends StatelessWidget {
  const CreateNewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.r),
            ),
          ),
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      getIt<RecommendationDoctorsCubit>()..getAllDoctors(),
                ),
                BlocProvider(
                  create: (context) =>
                      getIt<SpecializationsCubit>()..getSpecializations(),
                ),
              ],
              child: const CreateNewMessageBottomSheet(),
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          border: Border.all(color: ColorManger.lighterGrey),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: SvgPicture.asset("assets/svgs/message-add.svg"),
      ),
    );
  }
}
