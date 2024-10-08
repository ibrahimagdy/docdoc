import 'package:doctors_app/features/sign_up/data/model/sign_up_request_body.dart';
import 'package:doctors_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:doctors_app/features/sign_up/logic/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;

  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  TextEditingController nameController = TextEditingController();
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
        name: nameController.text,
        phone: phoneController.text,
        passwordConfirmation: passwordController.text,
        gender: 0,
      ),
    );
    response.when(
      success: (signUpResponse) {
        emit(SignUpState.success(signUpResponse));
      },
      failure: (error) {
        emit(SignUpState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
