import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/widgets/custom_snack_bar.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:doctors_app/features/auth/login/logic/login_cubit.dart';
import 'package:doctors_app/features/auth/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: LoadingCircleIndicator(),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.appLayout);
            CustomSnackBar.showSuccess(context, loginResponse.message);
          },
          error: (error) {
            while (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
            CustomSnackBar.showError(context, error.getAllErrorMessages());
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
