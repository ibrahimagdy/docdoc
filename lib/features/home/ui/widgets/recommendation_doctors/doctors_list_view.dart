import 'package:doctors_app/features/home/ui/widgets/recommendation_doctors/doctor_item.dart';
import 'package:flutter/material.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return const DoctorItem();
        },
        childCount: 10,
      ),
    );
  }
}
