import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/widgets/custom_app_bar.dart';
import 'package:doctors_app/features/home/ui/widgets/doctor_speciality/doctor_speciality_grid_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctors_app/features/home/logic/specializations_cubit.dart';
import 'package:doctors_app/core/di/dependency_injection.dart';

class SeeAllDoctorSpecialityScreen extends StatefulWidget {
  const SeeAllDoctorSpecialityScreen({super.key});

  @override
  State<SeeAllDoctorSpecialityScreen> createState() =>
      _SeeAllDoctorSpecialityScreenState();
}

class _SeeAllDoctorSpecialityScreenState
    extends State<SeeAllDoctorSpecialityScreen> {
  @override
  void initState() {
    super.initState();
    // getSpecializations will be called after the cubit is created in build
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpecializationsCubit>(
      create: (context) {
        final cubit = getIt<SpecializationsCubit>();
        cubit.getSpecializations();
        return cubit;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(16),
                  const CustomAppBar(
                    title: "Doctor Speciality",
                  ),
                  verticalSpace(42),
                  const DoctorSpecialityGridBlocBuilder(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
