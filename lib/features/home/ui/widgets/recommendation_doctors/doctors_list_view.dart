import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/home/logic/recommendation_doctors/recommendation_doctors_cubit.dart';
import 'package:doctors_app/features/home/logic/recommendation_doctors/recommendation_doctors_state.dart';
import 'package:doctors_app/features/home/ui/widgets/recommendation_doctors/doctor_item.dart';
import 'package:doctors_app/features/home/ui/widgets/recommendation_doctors/doctors_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationDoctorsCubit, RecommendationDoctorsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loading: () => const SliverToBoxAdapter(
            child: DoctorsShimmer(),
          ),
          success: (data) {
            final doctors = data.doctorsData.doctorsList;
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return DoctorItem(
                    doctorData: doctors[index],
                  );
                },
                childCount: doctors.length,
              ),
            );
          },
          error: (error) => SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h),
                child: Text(
                  error.getAllErrorMessages(),
                  style: TextStyles.font14RedRegular,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
