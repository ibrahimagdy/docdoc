import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/widgets/custom_snack_bar.dart';
import 'package:doctors_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:doctors_app/features/sign_up/logic/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(loading: () {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorManger.mainBlue,
              ),
            ),
          );
        }, success: (signUpResponse) {
          context.pop();
          context.pushNamed(Routes.loginScreen);
        }, error: (error) {
          CustomSnackBar.showError(context, error.getAllErrorMessages());
        });
      },
      child: const SizedBox.shrink(),
    );
  }

}
