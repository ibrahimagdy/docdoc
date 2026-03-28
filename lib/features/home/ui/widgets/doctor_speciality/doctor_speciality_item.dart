import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:doctors_app/features/home/data/models/specializations_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorSpecialityItem extends StatelessWidget {
  final SpecializationData specializationData;
  final bool isGridView;
  final VoidCallback? onTap;

  const DoctorSpecialityItem({
    super.key,
    required this.specializationData,
    this.isGridView = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: isGridView ? EdgeInsets.zero : EdgeInsets.only(right: 24.w),
        child: Column(
          children: [
            CircleAvatar(
              radius: isGridView ? 40.r : 32.r,
              backgroundColor: ColorManger.lightBlue,
              child: SvgPicture.network(
                specializationData.spcializationIcons,
                placeholderBuilder: (context) => const LoadingCircleIndicator(),
              ),
            ),
            verticalSpace(12),
            Text(
              specializationData.name,
              style: TextStyles.font12DarkBlueRegular,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
