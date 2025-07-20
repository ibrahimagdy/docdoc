import 'package:doctors_app/core/networking/api_error_model.dart';
import 'package:doctors_app/features/auth/login/data/model/login_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@Freezed()
class LoginState<T> with _$LoginState<T>{
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(LoginResponse loginResponse) = Success;
  const factory LoginState.error({required ApiErrorModel error}) = Error;
}

