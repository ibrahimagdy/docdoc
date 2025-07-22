import 'package:doctors_app/core/networking/api_error_model.dart';
import 'package:doctors_app/features/auth/reset_password/data/models/reset_password_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = ResetPasswordInitial;

  const factory ResetPasswordState.loadingStoredData() = LoadingStoredData;

  const factory ResetPasswordState.resetPasswordLoading() =
      ResetPasswordLoading;

  const factory ResetPasswordState.resetPasswordSuccess(
          ResetPasswordResponseModel resetPasswordResponseModel) =
      ResetPasswordSuccess;

  const factory ResetPasswordState.error({required ApiErrorModel error}) =
      ResetPasswordError;
}
