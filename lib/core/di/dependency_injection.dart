import 'package:dio/dio.dart';
import 'package:doctors_app/core/networking/api_service.dart';
import 'package:doctors_app/core/networking/dio_factory.dart';
import 'package:doctors_app/features/auth/forgot_password/data/repo/forgot_password_repo.dart';
import 'package:doctors_app/features/auth/forgot_password/logic/forgot_password_cubit.dart';
import 'package:doctors_app/features/auth/login/data/repos/login_repo.dart';
import 'package:doctors_app/features/auth/login/logic/login_cubit.dart';
import 'package:doctors_app/features/auth/otp/data/repo/verify_otp_repo.dart';
import 'package:doctors_app/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:doctors_app/features/auth/reset_password/data/repo/reset_password_repo.dart';
import 'package:doctors_app/features/auth/reset_password/logic/reset_password_cubit.dart';
import 'package:doctors_app/features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:doctors_app/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:doctors_app/features/doctor_details/data/repos/doctor_details_repo.dart';
import 'package:doctors_app/features/doctor_details/data/repos/reviews_repo.dart';
import 'package:doctors_app/features/doctor_details/logic/reviews/reviews_cubit.dart';
import 'package:doctors_app/features/home/data/repos/recommendation_doctors_repo.dart';
import 'package:doctors_app/features/home/data/repos/specializations_repo.dart';
import 'package:doctors_app/features/doctor_details/logic/doctor_details/doctor_details_cubit.dart';
import 'package:doctors_app/features/home/logic/doctor_speciality/specializations_cubit.dart';
import 'package:doctors_app/features/home/logic/find_nearby/find_nearby_cubit.dart';
import 'package:doctors_app/features/home/logic/recommendation_doctors/recommendation_doctors_cubit.dart';
import 'package:doctors_app/features/personal_info/data/repos/personal_info_repo.dart';
import 'package:doctors_app/features/personal_info/logic/personal_info_cubit.dart';
import 'package:doctors_app/features/profile/data/repos/profile_patient_repo.dart';
import 'package:doctors_app/features/profile/logic/profile_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  /// login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  /// signUp
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  /// forgot password
  getIt.registerLazySingleton<ForgotPasswordRepo>(
      () => ForgotPasswordRepo(getIt()));
  getIt
      .registerFactory<ForgotPasswordCubit>(() => ForgotPasswordCubit(getIt()));

  /// otp
  getIt.registerLazySingleton<VerifyOtpRepo>(() => VerifyOtpRepo(getIt()));
  getIt.registerFactory<VerifyOtpCubit>(() => VerifyOtpCubit(getIt()));

  /// reset password
  getIt.registerLazySingleton<ResetPasswordRepo>(
      () => ResetPasswordRepo(getIt()));
  getIt.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(getIt()));

  /// profile
  getIt.registerLazySingleton<ProfilePatientRepo>(
      () => ProfilePatientRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));

  /// personal info
  getIt
      .registerLazySingleton<PersonalInfoRepo>(() => PersonalInfoRepo(getIt()));
  getIt.registerFactoryParam<PersonalInfoCubit, ProfileCubit, void>(
    (profileCubit, _) => PersonalInfoCubit(getIt(), profileCubit),
  );

  /// specializations
  getIt.registerLazySingleton<SpecializationsRepo>(
      () => SpecializationsRepo(getIt()));
  getIt.registerFactory<SpecializationsCubit>(
      () => SpecializationsCubit(getIt()));

  /// recommendation doctors
  getIt.registerLazySingleton<RecommendationDoctorsRepo>(
    () => RecommendationDoctorsRepo(getIt()),
  );
  getIt.registerFactory<RecommendationDoctorsCubit>(
    () => RecommendationDoctorsCubit(getIt()),
  );

  /// doctor details
  getIt.registerLazySingleton<DoctorDetailsRepo>(
    () => DoctorDetailsRepo(getIt()),
  );
  getIt.registerFactory<DoctorDetailsCubit>(
    () => DoctorDetailsCubit(getIt()),
  );

  /// reviews
  getIt.registerLazySingleton<ReviewsRepo>(
    () => ReviewsRepo(getIt()),
  );
  getIt.registerFactory<ReviewsCubit>(
    () => ReviewsCubit(getIt()),
  );

  /// find nearby
  getIt.registerFactory<FindNearbyCubit>(
    () => FindNearbyCubit(getIt()),
  );
}
