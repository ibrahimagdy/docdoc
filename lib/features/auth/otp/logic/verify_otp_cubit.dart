import 'package:doctors_app/features/auth/otp/data/models/verify_otp_request_model.dart';
import 'package:doctors_app/features/auth/otp/data/repo/verify_otp_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final VerifyOtpRepo _verifyOtpRepo;
  String? enteredOtp;

  VerifyOtpCubit(this._verifyOtpRepo) : super(const VerifyOtpState.initial());

  Future<void> verifyOtp(VerifyOtpRequestModel verifyOtpRequestModel) async {
    emit(const VerifyOtpState.loading());
    final result = await _verifyOtpRepo.verifyOtp(verifyOtpRequestModel);

    result.when(
      success: (response) => emit(VerifyOtpState.success(response)),
      failure: (error) => emit(VerifyOtpState.error(error: error)),
    );
  }
}