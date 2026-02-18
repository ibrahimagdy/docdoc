import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/widgets/app_text_form_field.dart';
import 'package:doctors_app/core/widgets/custom_app_bar.dart';
import 'package:doctors_app/core/widgets/end_app_bar_widget.dart';
import 'package:doctors_app/features/home/logic/recommendation_doctors/recommendation_doctors_cubit.dart';
import 'package:doctors_app/features/home/ui/widgets/recommendation_doctors/doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SeeAllRecommendationDoctorsScreen extends StatefulWidget {
  const SeeAllRecommendationDoctorsScreen({super.key});

  @override
  State<SeeAllRecommendationDoctorsScreen> createState() =>
      _SeeAllRecommendationDoctorsScreenState();
}

class _SeeAllRecommendationDoctorsScreenState
    extends State<SeeAllRecommendationDoctorsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<RecommendationDoctorsCubit>().getAllDoctors();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll >= maxScroll * 0.5) {
      context.read<RecommendationDoctorsCubit>().loadMore();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              verticalSpace(16),
              const CustomAppBar(
                title: 'Recommendation Doctors',
                endWidget: EndAppBarWidget(icon: Icons.more_horiz),
              ),
              verticalSpace(32),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: _searchController,
                      fillColor: ColorManger.moreLighterGrey,
                      hintText: "Search",
                      prefixIcon: SvgPicture.asset(
                        "assets/svgs/search.svg",
                        width: 24.w,
                        height: 24.h,
                      ),
                      onChanged: (value) {
                        context
                            .read<RecommendationDoctorsCubit>()
                            .search(value);
                      },
                    ),
                  ),
                  horizontalSpace(12),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/svgs/sort.svg",
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: const DoctorsListView(isSliver: false),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
