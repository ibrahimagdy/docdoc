import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/doctor_details/logic/reviews/reviews_cubit.dart';
import 'package:doctors_app/features/doctor_details/logic/reviews/reviews_state.dart';
import 'package:doctors_app/features/doctor_details/ui/loading_shimmer/shimmer_reviews_list.dart';
import 'package:doctors_app/features/doctor_details/ui/widgets/review_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsReviewsTab extends StatelessWidget {
  final String doctorId;

  const DoctorDetailsReviewsTab({
    super.key,
    required this.doctorId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const ShimmerReviewsList(),
          success: (reviews) {
            if (reviews.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.rate_review_outlined,
                      size: 64.sp,
                      color: ColorManger.grey,
                    ),
                    verticalSpace(16),
                    Text(
                      'No reviews yet',
                      style: TextStyles.font14GreyMedium,
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return ReviewItemWidget(review: reviews[index]);
              },
            );
          },
          error: (error) => Center(
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
        );
      },
    );
  }
}
