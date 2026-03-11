import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/doctor_details/data/models/doctor_details_response.dart';
import 'package:doctors_app/features/doctor_details/logic/reviews/reviews_cubit.dart';
import 'package:doctors_app/features/doctor_details/ui/widgets/doctor_details_about_tab.dart';
import 'package:doctors_app/features/doctor_details/ui/widgets/doctor_details_location_tab.dart';
import 'package:doctors_app/features/doctor_details/ui/widgets/doctor_details_reviews_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsTabBar extends StatefulWidget {
  final DoctorDetailsData doctorDetails;
  const DoctorDetailsTabBar({super.key, required this.doctorDetails});

  @override
  State<DoctorDetailsTabBar> createState() => _DoctorDetailsTabBarState();
}

class _DoctorDetailsTabBarState extends State<DoctorDetailsTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    // When switching to Reviews tab (index 2), load reviews
    if (_tabController.index == 2) {
      context.read<ReviewsCubit>().getReviews(widget.doctorDetails.id);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            dividerColor: ColorManger.lighterGrey,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: ColorManger.mainBlue,
            indicatorColor: ColorManger.mainBlue,
            labelStyle: TextStyles.font14DarkBlueBold,
            unselectedLabelStyle: TextStyles.font14darkGreyBold,
            tabs: const [
              Tab(text: 'About'),
              Tab(text: 'Location'),
              Tab(text: 'Reviews'),
            ],
          ),
          verticalSpace(32),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                DoctorDetailsAboutTab(doctorDetails: widget.doctorDetails),
                DoctorDetailsLocationTab(doctorDetails: widget.doctorDetails),
                DoctorDetailsReviewsTab(doctorId: widget.doctorDetails.id),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
