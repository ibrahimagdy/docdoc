import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/home/logic/doctor_speciality/specializations_cubit.dart';
import 'package:doctors_app/features/home/logic/doctor_speciality/specializations_state.dart';
import 'package:doctors_app/features/home/ui/widgets/doctor_speciality/doctor_speciality_list_view.dart';
import 'package:doctors_app/features/home/ui/widgets/doctor_speciality/doctor_speciality_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityBlocBuilder extends StatelessWidget {
  const DoctorSpecialityBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecializationsCubit, SpecializationsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loading: () => SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: const DoctorSpecialityShimmer(),
            ),
          ),
          success: (data) => SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: DoctorSpecialityListView(
                specializationsList: data.specializationsList,
              ),
            ),
          ),
          error: (error) => SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h),
                child: Text(
                  error.getAllErrorMessages(),
                  style: TextStyles.font14RedRegular,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
