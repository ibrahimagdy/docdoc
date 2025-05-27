import 'package:doctors_app/core/helpers/constants.dart';
import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/core/networking/dio_factory.dart';
import 'package:doctors_app/features/login/data/model/login_request_body.dart';
import 'package:doctors_app/features/login/data/repos/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) async {
        await saveUserDetails(
          loginResponse.userData?.token ?? '',
          loginResponse.userData?.username ?? '',
        );
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  Future<void> saveUserDetails(String token, String userName) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userName, userName);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
