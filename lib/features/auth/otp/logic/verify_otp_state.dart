import 'package:doctors_app/core/networking/api_error_model.dart';
import 'package:doctors_app/features/auth/otp/data/models/verify_otp_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp_state.freezed.dart';

@freezed
class VerifyOtpState<T> with _$VerifyOtpState<T> {
  const factory VerifyOtpState.initial() = _Initial;

  const factory VerifyOtpState.loading() = VerifyOtpLoading;

  const factory VerifyOtpState.success(
      VerifyOtpResponseModel verifyOtpResponseModel) = VerifyOtpSuccess<T>;

  const factory VerifyOtpState.error({required ApiErrorModel error}) =
      VerifyOtpError;
}
