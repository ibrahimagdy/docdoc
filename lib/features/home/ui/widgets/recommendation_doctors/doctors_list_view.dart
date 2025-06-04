import 'package:doctors_app/features/home/data/model/specialization_responses_model.dart';
import 'package:doctors_app/features/home/ui/widgets/recommendation_doctors/doctor_item.dart';
import 'package:flutter/material.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors?>? doctorsList;
  const DoctorsListView({super.key, required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        doctorsList?.length ?? 0,
            (index) => DoctorItem(
          doctors: doctorsList?[index],
        ),
      ),
    );
  }
}