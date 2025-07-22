import 'package:dio/dio.dart';
import 'package:doctors_app/core/networking/api_service.dart';
import 'package:doctors_app/core/networking/dio_factory.dart';
import 'package:doctors_app/features/auth/forgot_password/data/repo/forgot_password_repo.dart';
import 'package:doctors_app/features/auth/forgot_password/logic/forgot_password_cubit.dart';
import 'package:doctors_app/features/auth/login/data/repos/login_repo.dart';
import 'package:doctors_app/features/auth/login/logic/login_cubit.dart';
import 'package:doctors_app/features/auth/otp/data/repo/verify_otp_repo.dart';
import 'package:doctors_app/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:doctors_app/features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:doctors_app/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(()=> ApiService(dio));

  /// login
  getIt.registerLazySingleton<LoginRepo>(()=> LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(()=> LoginCubit(getIt()));

  /// signUp
  getIt.registerLazySingleton<SignUpRepo>(()=> SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(()=> SignUpCubit(getIt()));

  /// forgot password
  getIt.registerLazySingleton<ForgotPasswordRepo>(()=> ForgotPasswordRepo(getIt()));
  getIt.registerFactory<ForgotPasswordCubit>(()=> ForgotPasswordCubit(getIt()));

  /// otp
  getIt.registerLazySingleton<VerifyOtpRepo>(()=> VerifyOtpRepo(getIt()));
  getIt.registerFactory<VerifyOtpCubit>(()=> VerifyOtpCubit(getIt()));

}