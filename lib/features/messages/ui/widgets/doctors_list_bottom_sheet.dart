import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:doctors_app/features/home/logic/recommendation_doctors/recommendation_doctors_cubit.dart';
import 'package:doctors_app/features/home/logic/recommendation_doctors/recommendation_doctors_state.dart';
import 'package:doctors_app/features/messages/ui/widgets/doctor_message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListBottomSheet extends StatelessWidget {
  final ScrollController scrollController;

  const DoctorsListBottomSheet({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationDoctorsCubit, RecommendationDoctorsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const LoadingCircleIndicator(),
          loading: () => const LoadingCircleIndicator(),
          loadingMore: (currentDoctors, currentPage) {
            return ListView.separated(
              controller: scrollController,
              itemCount: currentDoctors.length + 1,
              separatorBuilder: (context, index) => const Divider(
                color: ColorManger.lighterGrey,
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                if (index == currentDoctors.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: LoadingCircleIndicator()),
                  );
                }
                return DoctorMessageItem(doctorData: currentDoctors[index]);
              },
            );
          },
          success: (data, allDoctors, hasMore, currentPage) {
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

            return ListView.separated(
              controller: scrollController,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              itemCount: allDoctors.length + (hasMore ? 1 : 0),
              separatorBuilder: (context, index) => const Divider(
                color: ColorManger.lighterGrey,
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                if (index == allDoctors.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: LoadingCircleIndicator()),
                  );
                }
                return DoctorMessageItem(doctorData: allDoctors[index]);
              },
            );
          },
          error: (error) => Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: Text(
                error.getAllErrorMessages(),
                style: TextStyles.font14RedRegular,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
