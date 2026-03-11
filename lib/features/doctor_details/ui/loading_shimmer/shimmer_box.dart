import 'package:doctors_app/features/doctor_details/ui/loading_shimmer/sliding_gradient_transform.dart';
import 'package:flutter/material.dart';

class ShimmerBox extends StatelessWidget {
  final Animation<double> animation;
  final double? width;
  final double height;
  final double borderRadius;

  const ShimmerBox({
    super.key,
    required this.animation,
    this.width,
    required this.height,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.0, 0.5, 1.0],
          colors: const [
            Color(0xFFEEEEEE),
            Color(0xFFF8F8F8),
            Color(0xFFEEEEEE),
          ],
          transform: SlidingGradientTransform(slidePercent: animation.value),
        ),
      ),
    );
  }
}
