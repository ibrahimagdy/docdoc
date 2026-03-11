import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/doctor_details/logic/doctor_details_cubit.dart';
import 'package:doctors_app/features/doctor_details/logic/doctor_details_state.dart';
import 'package:doctors_app/features/doctor_details/ui/loading_shimmer/doctor_details_shimmer.dart';
import 'package:doctors_app/features/doctor_details/ui/widgets/doctor_details_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final String doctorId;

  const DoctorDetailsScreen({
    super.key,
    required this.doctorId,
  });

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorDetailsCubit>().getDoctorDetails(widget.doctorId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.white,
      body: SafeArea(
        child: BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const DoctorDetailsShimmer(),
              success: (doctorDetails) => DoctorDetailsContent(
                doctorDetails: doctorDetails,
              ),
              error: (error) => Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64.sp,
                        color: Colors.red,
                      ),
                      verticalSpace(16),
                      Text(
                        error.getAllErrorMessages(),
                        textAlign: TextAlign.center,
                        style: TextStyles.font14RedRegular,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
