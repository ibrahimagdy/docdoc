import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/features/home/logic/doctor_speciality/specializations_cubit.dart';
import 'package:doctors_app/features/home/logic/recommendation_doctors/recommendation_doctors_cubit.dart';
import 'package:doctors_app/features/messages/ui/widgets/create_message_header.dart';
import 'package:doctors_app/features/messages/ui/widgets/doctors_list_bottom_sheet.dart';
import 'package:doctors_app/features/messages/ui/widgets/search_and_filter_row.dart';
import 'package:doctors_app/features/home/ui/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewMessageBottomSheet extends StatefulWidget {
  const CreateNewMessageBottomSheet({super.key});

  @override
  State<CreateNewMessageBottomSheet> createState() =>
      _CreateNewMessageBottomSheetState();
}

class _CreateNewMessageBottomSheetState
    extends State<CreateNewMessageBottomSheet> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String? _selectedSpeciality;
  double? _selectedRating;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      context.read<RecommendationDoctorsCubit>().loadMore();
    }
  }

  void _showSortBottomSheet() {
    final specializationsCubit = context.read<SpecializationsCubit>();
    final recommendationDoctorsCubit =
        context.read<RecommendationDoctorsCubit>();

    specializationsCubit.state.whenOrNull(
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
    searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        color: ColorManger.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpace(41),
            const CreateMessageHeader(),
            verticalSpace(33),
            SearchAndFilterRow(
              controller: searchController,
              onChanged: (value) {
                context.read<RecommendationDoctorsCubit>().search(value);
              },
              onFilterTap: _showSortBottomSheet,
            ),
            verticalSpace(16),
            Flexible(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.6,
                ),
                child: DoctorsListBottomSheet(
                  scrollController: _scrollController,
                ),
              ),
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
