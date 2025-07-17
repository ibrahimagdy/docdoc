import 'package:doctors_app/core/theming/colors.dart';
import 'package:flutter/material.dart';

class LoadingCircleIndicator extends StatelessWidget {
  const LoadingCircleIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorManger.mainBlue,
      ),
    );
  }
}