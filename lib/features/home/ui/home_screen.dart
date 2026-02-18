import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/features/home/logic/doctor_speciality/specializations_cubit.dart';
import 'package:doctors_app/features/home/logic/recommendation_doctors/recommendation_doctors_cubit.dart';
import 'package:doctors_app/features/home/ui/widgets/doctor_blue_container.dart';
import 'package:doctors_app/features/home/ui/widgets/doctor_speciality/doctor_speciality_bloc_builder.dart';
import 'package:doctors_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:doctors_app/features/home/ui/widgets/recommendation_doctors/doctors_list_view.dart';
import 'package:doctors_app/features/home/ui/widgets/see_all_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  children: [
                    const HomeTopBar(),
                    const DoctorBlueContainer(),
                    verticalSpace(24),
                    SeeAllWidget(
                      text: "Doctor Speciality",
                      onTap: () {
                        final cubit = context.read<SpecializationsCubit>();
                        context.pushNamed(
                          Routes.seeAllDoctorSpecialityScreen,
                          arguments: cubit,
                        );
                      },
                    ),
                    verticalSpace(16),
                  ],
                ),
              ),
            ),
            const DoctorSpecialityBlocBuilder(),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    verticalSpace(23),
                    SeeAllWidget(
                      text: "Recommendation Doctor",
                      onTap: () {
                        final cubit =
                            context.read<RecommendationDoctorsCubit>();
                        context.pushNamed(
                          Routes.seeAllRecommendationDoctorsScreen,
                          arguments: cubit,
                        );
                      },
                    ),
                    verticalSpace(20),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: const DoctorsListView(),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(20),
            ),
          ],
        ),
      ),
    );
  }
}
