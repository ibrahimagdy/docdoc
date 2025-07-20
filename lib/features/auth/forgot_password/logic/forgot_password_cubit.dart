import 'package:doctors_app/features/auth/forgot_password/data/models/forgot_password_request_model.dart';
import 'package:doctors_app/features/auth/forgot_password/data/repo/forgot_password_repo.dart';
import 'package:doctors_app/features/auth/forgot_password/logic/forgot_password_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepo _forgotPasswordRepo;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordCubit(this._forgotPasswordRepo)
      : super(const ForgotPasswordState.initial());

  void resetPassword(String email) async {
    emit(const ForgotPasswordState.loading());

    final response = await _forgotPasswordRepo.forgotPassword(
      ForgotPasswordRequestModel(email: email),
    );

    response.when(
      success: (data) => emit(ForgotPasswordState.success(data)),
      failure: (error) => emit(ForgotPasswordState.error(error: error)),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}