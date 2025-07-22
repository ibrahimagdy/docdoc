import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/core/networking/api_error_model.dart';
import 'package:doctors_app/features/auth/reset_password/data/models/reset_password_request_model.dart';
import 'package:doctors_app/features/auth/reset_password/data/repo/reset_password_repo.dart';
import 'package:doctors_app/features/auth/reset_password/logic/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo _resetPasswordRepo;
  String? _email;
  String? _otp;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  ResetPasswordCubit(this._resetPasswordRepo)
      : super(const ResetPasswordState.initial()) {
    _loadStoredData();
  }

  Future<void> _loadStoredData() async {
    emit(const ResetPasswordState.loadingStoredData());
    try {
      final email = await SharedPrefHelper.getString('email');
      final otp = await SharedPrefHelper.getSecuredString('otp');
      _email = email;
      _otp = otp;
    } catch (e) {
      emit(ResetPasswordState.error(
          error: ApiErrorModel(message: 'Failed to load stored data: $e')));
    }
  }

  Future<void> resetPassword() async {
    if (_email == null || _otp == null) {
      emit(ResetPasswordState.error(
          error: ApiErrorModel(message: 'Email or OTP not loaded')));
      return;
    }
    emit(const ResetPasswordState.resetPasswordLoading());
    final requestModel = ResetPasswordRequestModel(
      email: _email!,
      otp: _otp!,
      password: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
    );
    final result = await _resetPasswordRepo.resetPassword(requestModel);
    result.when(
      success: (response) =>
          emit(ResetPasswordState.resetPasswordSuccess(response)),
      failure: (error) => emit(ResetPasswordState.error(error: error)),
    );
  }
}
