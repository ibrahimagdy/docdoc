import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/widgets/custom_app_bar.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:doctors_app/features/home/logic/find_nearby/find_nearby_cubit.dart';
import 'package:doctors_app/features/home/logic/find_nearby/find_nearby_state.dart';
import 'package:doctors_app/features/home/ui/widgets/find_nearby/find_nearby_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindNearbyScreen extends StatelessWidget {
  const FindNearbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: BlocBuilder<FindNearbyCubit, FindNearbyState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: LoadingCircleIndicator(),
            ),
            success: (doctors) => Stack(
              children: [
                FindNearbyMap(doctors: doctors),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withValues(alpha: 0.95),
                            Colors.white.withValues(alpha: 0.8),
                            Colors.white.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                      child: SafeArea(
                        child: Column(
                          children: [
                            verticalSpace(16),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: const CustomAppBar(title: 'Find Nearby'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      error.getAllErrorMessages(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
