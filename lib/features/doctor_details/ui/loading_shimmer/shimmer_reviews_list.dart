import 'package:doctors_app/features/doctor_details/ui/loading_shimmer/shimmer_review_item.dart';
import 'package:flutter/material.dart';

class ShimmerReviewsList extends StatefulWidget {
  const ShimmerReviewsList({super.key});

  @override
  State<ShimmerReviewsList> createState() => _ShimmerReviewsListState();
}

class _ShimmerReviewsListState extends State<ShimmerReviewsList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _animation = Tween<double>(begin: -1.5, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ShimmerReviewItem(animation: _animation);
          },
        );
      },
    );
  }
}
