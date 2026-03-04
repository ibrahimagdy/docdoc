import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/app_text_button.dart';
import 'package:doctors_app/features/home/data/models/specializations_response.dart';
import 'package:doctors_app/features/home/ui/widgets/sort_bottom_sheet/rating_filter_list.dart';
import 'package:doctors_app/features/home/ui/widgets/sort_bottom_sheet/speciality_filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortBottomSheet extends StatefulWidget {
  final String? selectedSpeciality;
  final double? selectedRating;
  final List<SpecializationData> specializations;
  final Function(String? speciality, double? rating) onApply;

  const SortBottomSheet({
    super.key,
    this.selectedSpeciality,
    this.selectedRating,
    required this.specializations,
    required this.onApply,
  });

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  String? _selectedSpeciality;
  double? _selectedRating;

  @override
  void initState() {
    super.initState();
    _selectedSpeciality = widget.selectedSpeciality;
    _selectedRating = widget.selectedRating;
  }

  void _onSpecialityChanged(String? speciality) {
    setState(() {
      _selectedSpeciality = speciality;
    });
  }

  void _onRatingChanged(double? rating) {
    setState(() {
      _selectedRating = rating;
    });
  }

  void _onDone() {
    widget.onApply(_selectedSpeciality, _selectedRating);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpace(8),
            Container(
              width: 58.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: ColorManger.moreLighterGrey,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            verticalSpace(42),
            Text(
              'Sort By',
              style: TextStyles.font18DarkBlueSemiBold,
            ),
            verticalSpace(16),
            Divider(
              color: ColorManger.lighterGrey,
              thickness: 1.h,
              height: 1.h,
            ),
            verticalSpace(33),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Speciality',
                  style: TextStyles.font16DarkBlueBold,
                ),
                verticalSpace(24),
                SpecialityFilterList(
                  specializations: widget.specializations,
                  selectedSpeciality: _selectedSpeciality,
                  onSpecialityChanged: _onSpecialityChanged,
                ),
                verticalSpace(32),
                Text(
                  'Rating',
                  style: TextStyles.font16DarkBlueBold,
                ),
                verticalSpace(16),
                RatingFilterList(
                  selectedRating: _selectedRating,
                  onRatingChanged: _onRatingChanged,
                ),
                verticalSpace(32),
                AppTextButton(
                  text: "Done",
                  onPressed: _onDone,
                ),
                verticalSpace(24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
