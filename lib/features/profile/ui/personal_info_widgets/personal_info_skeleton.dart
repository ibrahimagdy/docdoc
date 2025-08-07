import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoSkeleton extends StatefulWidget {
  const PersonalInfoSkeleton({super.key});

  @override
  State<PersonalInfoSkeleton> createState() => _PersonalInfoSkeletonState();
}

class _PersonalInfoSkeletonState extends State<PersonalInfoSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Column(
          children: [
            _buildSkeletonFormField(),
            verticalSpace(16),
            _buildSkeletonFormField(),
            verticalSpace(16),
            _buildSkeletonFormField(),
            verticalSpace(24),
          ],
        );
      },
    );
  }

  Widget _buildSkeletonFormField() {
    return Container(
      width: double.infinity,
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: ColorManger.lighterGrey.withValues(alpha: _animation.value * 0.3),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: ColorManger.lighterGrey.withValues(alpha: _animation.value * 0.5),
          width: 1.3,
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 16.h,
          width: double.infinity * 0.6,
          decoration: BoxDecoration(
            color: ColorManger.lighterGrey.withValues(alpha:_animation.value * 0.6),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }
}