import 'package:doctors_app/core/di/dependency_injection.dart';
import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/widgets/app_text_button.dart';
import 'package:doctors_app/core/widgets/custom_app_bar.dart';
import 'package:doctors_app/features/doctor_details/data/models/doctor_details_response.dart';
import 'package:doctors_app/features/doctor_details/logic/reviews/reviews_cubit.dart';
import 'package:doctors_app/features/doctor_details/ui/widgets/doctor_details_info.dart';
import 'package:doctors_app/features/doctor_details/ui/widgets/doctor_details_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsContent extends StatelessWidget {
  final DoctorDetailsData doctorDetails;

  const DoctorDetailsContent({
    super.key,
    required this.doctorDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReviewsCubit>(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            verticalSpace(16),
            CustomAppBar(title: doctorDetails.fullName),
            verticalSpace(32),
            DoctorDetailsInfo(
              doctorDetails: doctorDetails,
            ),
            verticalSpace(24),
            Expanded(
              child: DoctorDetailsTabBar(
                doctorDetails: doctorDetails,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: AppTextButton(
                text: 'Make An Appointment',
                onPressed: () {
                  context.pushNamed(Routes.bookAppointmentScreen);
                },
              ),
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
