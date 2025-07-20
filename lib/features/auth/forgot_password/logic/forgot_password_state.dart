import 'package:doctors_app/core/networking/api_error_model.dart';
import 'package:doctors_app/features/auth/forgot_password/data/models/forgot_password_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState<T> with _$ForgotPasswordState<T> {
  const factory ForgotPasswordState.initial() = _Initial;

  const factory ForgotPasswordState.loading() = ForgotPasswordLoading;

  const factory ForgotPasswordState.success(
          ForgotPasswordResponseModel forgotPasswordResponseModel) =
      ForgotPasswordSuccess<T>;

  const factory ForgotPasswordState.error({required ApiErrorModel error}) =
      ForgotPasswordError;
}
