import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/features/auth/sign_up/data/model/sign_up_request_body.dart';
import 'package:doctors_app/features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:doctors_app/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;

  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void signUp() async {
    emit(const SignUpState.loading());
    final response = await _signUpRepo.login(
      SignUpRequestBody(
        email: emailController.text,
        password: passwordController.text,
        fullName: fullNameController.text,
        userName: userNameController.text,
        phoneNumber: phoneController.text,
        confirmPassword: passwordController.text,
      ),
    );
    response.when(
      success: (signUpResponse) async {
        await SharedPrefHelper.saveUserDetails(
          id: '',
          userName: signUpResponse.userData.userName,
          email: signUpResponse.userData.email,
        );
        emit(SignUpState.success(signUpResponse));
      },
      failure: (error) {
        emit(SignUpState.error(error: error));
      },
    );
  }

  @override
  Future<void> close() {
    fullNameController.dispose();
    userNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    return super.close();
  }
}
