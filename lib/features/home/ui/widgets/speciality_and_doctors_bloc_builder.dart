import 'package:doctors_app/features/home/ui/widgets/recommendation_doctors/doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'doctor_speciality/doctor_speciality_list_view.dart';

class SpecialityAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecialityAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () => setupLoading(),
          specializationsSuccess: (specializationResponseModel) {
            var specializationList = specializationResponseModel;
            return setupSuccess(specializationList);
          },
          specializationsError: (errorHandler) => setupError(),
          orElse: () {
            return setupError();
          },
        );
      },
    );
  }
}

Widget setupLoading(){
  return const SizedBox(
    height: 100,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget setupSuccess(specializationList){
  return Expanded(
    child: Column(
      children: [
        DoctorSpecialityListView(
          specializationDataList: specializationList ?? [],
        ),
        verticalSpace(20),
        DoctorsListView(
          doctorsList: specializationList?[0]?.doctorsList,
        ),
      ],
    ),
  );
}

Widget setupError(){
  return const SizedBox.shrink();
}
