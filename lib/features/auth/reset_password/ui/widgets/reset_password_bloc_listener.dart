import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/widgets/custom_snack_bar.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:doctors_app/features/auth/reset_password/logic/reset_password_cubit.dart';
import 'package:doctors_app/features/auth/reset_password/logic/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordBlocListener extends StatelessWidget {
  const ResetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          resetPasswordLoading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const LoadingCircleIndicator(),
            );
          },
          resetPasswordSuccess: (response) {
            Navigator.pop(context);
            context.pushReplacementNamed(Routes.loginScreen);
            CustomSnackBar.showSuccess(context, response.message);
          },
          error: (error) {
            Navigator.pop(context);
            CustomSnackBar.showError(context, error.getAllErrorMessages());
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}