import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/widgets/app_text_form_field.dart';
import 'package:doctors_app/core/widgets/custom_app_bar.dart';
import 'package:doctors_app/core/widgets/end_app_bar_widget.dart';
import 'package:doctors_app/features/home/logic/doctor_speciality/specializations_cubit.dart';
import 'package:doctors_app/features/home/logic/recommendation_doctors/recommendation_doctors_cubit.dart';
import 'package:doctors_app/features/home/ui/widgets/recommendation_doctors/doctors_list_view.dart';
import 'package:doctors_app/features/home/ui/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SeeAllRecommendationDoctorsScreen extends StatefulWidget {
  final SpecializationsCubit specializationsCubit;

  const SeeAllRecommendationDoctorsScreen({
    super.key,
    required this.specializationsCubit,
  });

  @override
  State<SeeAllRecommendationDoctorsScreen> createState() =>
      _SeeAllRecommendationDoctorsScreenState();
}

class _SeeAllRecommendationDoctorsScreenState
    extends State<SeeAllRecommendationDoctorsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String? _selectedSpeciality;
  double? _selectedRating;

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

  void _showSortBottomSheet() {
    final specializationsState = widget.specializationsCubit.state;
    final recommendationDoctorsCubit =
        context.read<RecommendationDoctorsCubit>();

    specializationsState.whenOrNull(
      success: (data) {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (context) => SortBottomSheet(
            selectedSpeciality: _selectedSpeciality,
            selectedRating: _selectedRating,
            specializations: data.specializationsList,
            onApply: (speciality, rating) {
              setState(() {
                _selectedSpeciality = speciality;
                _selectedRating = rating;
              });

              recommendationDoctorsCubit.applyFilters(
                specialization: speciality,
                rating: rating,
              );
            },
          ),
        );
      },
    );
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
                    onTap: _showSortBottomSheet,
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
