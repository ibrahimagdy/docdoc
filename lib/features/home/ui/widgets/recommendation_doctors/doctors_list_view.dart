import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:doctors_app/features/home/logic/recommendation_doctors/recommendation_doctors_cubit.dart';
import 'package:doctors_app/features/home/logic/recommendation_doctors/recommendation_doctors_state.dart';
import 'package:doctors_app/features/home/ui/widgets/recommendation_doctors/doctor_item.dart';
import 'package:doctors_app/features/home/ui/widgets/recommendation_doctors/doctors_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListView extends StatelessWidget {
  /// [isSliver] = true  → used inside HomeScreen within CustomScrollView
  /// [isSliver] = false → used inside SeeAllScreen within a normal Column
  final bool isSliver;

  const DoctorsListView({
    super.key,
    this.isSliver = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationDoctorsCubit, RecommendationDoctorsState>(
      builder: (context, state) {
        return state.when(
          initial: () => isSliver
              ? const SliverToBoxAdapter(child: SizedBox.shrink())
              : const SizedBox.shrink(),
          loading: () => isSliver
              ? const SliverToBoxAdapter(child: DoctorsShimmer())
              : const DoctorsShimmer(),
          loadingMore: (currentDoctors, currentPage) {
            if (isSliver) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index == currentDoctors.length) {
                      return const LoadingCircleIndicator();
                    }
                    return DoctorItem(doctorData: currentDoctors[index]);
                  },
                  childCount: currentDoctors.length + 1,
                ),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: currentDoctors.length + 1,
              itemBuilder: (context, index) {
                if (index == currentDoctors.length) {
                  return const LoadingCircleIndicator();
                }
                return DoctorItem(doctorData: currentDoctors[index]);
              },
            );
          },
          success: (data, allDoctors, hasMore, currentPage) {
            // ─── HomeScreen (Sliver) ───────────────────────────────────────
            if (isSliver) {
              final doctors = data.doctorsData?.doctorsList ?? [];

              if (doctors.isEmpty) {
                return const SliverToBoxAdapter(
                  child: SizedBox.shrink(),
                );
              }

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => DoctorItem(doctorData: doctors[index]),
                  childCount: doctors.length,
                ),
              );
            }

            // ─── SeeAllRecommendationDoctorsScreen (Non-Sliver) ────────────────────────────────
            if (allDoctors.isEmpty) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  child: Text(
                    'No doctors found',
                    style: TextStyles.font14GreyMedium,
                  ),
                ),
              );
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: allDoctors.length,
              itemBuilder: (context, index) =>
                  DoctorItem(doctorData: allDoctors[index]),
            );
          },
          error: (error) {
            final errorWidget = Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h),
                child: Text(
                  error.getAllErrorMessages(),
                  style: TextStyles.font14RedRegular,
                  textAlign: TextAlign.center,
                ),
              ),
            );
            return isSliver
                ? SliverToBoxAdapter(child: errorWidget)
                : errorWidget;
          },
        );
      },
    );
  }
}
