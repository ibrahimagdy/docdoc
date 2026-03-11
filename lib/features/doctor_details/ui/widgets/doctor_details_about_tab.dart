import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/doctor_details/data/models/doctor_details_response.dart';
import 'package:flutter/material.dart';

class DoctorDetailsAboutTab extends StatelessWidget {
  final DoctorDetailsData doctorDetails;

  const DoctorDetailsAboutTab({super.key, required this.doctorDetails});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About me',
            style: TextStyles.font16DarkBlueSemiBold,
          ),
          verticalSpace(12),
          Text(
            doctorDetails.aboutMe,
            style: TextStyles.font14GreyRegular,
          ),
          verticalSpace(24),
          Text(
            'Working Time',
            style: TextStyles.font16DarkBlueSemiBold,
          ),
          verticalSpace(12),
          Text(
            doctorDetails.workingTime,
            style: TextStyles.font14GreyRegular,
          ),
          verticalSpace(24),
          Text(
            'Experience',
            style: TextStyles.font16DarkBlueSemiBold,
          ),
          verticalSpace(12),
          Text(
            '${doctorDetails.yearsOfExperience} years',
            style: TextStyles.font14GreyRegular,
          ),
          verticalSpace(24),
          Text(
            'Degree',
            style: TextStyles.font16DarkBlueBold,
          ),
          verticalSpace(12),
          Text(
            doctorDetails.degree,
            style: TextStyles.font14GreyRegular,
          ),
        ],
      ),
    );
  }
}
