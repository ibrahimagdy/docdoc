import 'package:doctors_app/core/di/dependency_injection.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/features/auth/forgot_password/logic/forgot_password_cubit.dart';
import 'package:doctors_app/features/auth/forgot_password/ui/forgot_password_screen.dart';
import 'package:doctors_app/features/auth/login/logic/login_cubit.dart';
import 'package:doctors_app/features/auth/login/ui/login_screen.dart';
import 'package:doctors_app/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:doctors_app/features/auth/otp/ui/otp_screen.dart';
import 'package:doctors_app/features/auth/reset_password/logic/reset_password_cubit.dart';
import 'package:doctors_app/features/auth/reset_password/ui/reset_password_screen.dart';
import 'package:doctors_app/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:doctors_app/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:doctors_app/features/doctor_details/logic/doctor_details/doctor_details_cubit.dart';
import 'package:doctors_app/features/doctor_details/ui/widgets/doctor_details_full_screen_map.dart';
import 'package:doctors_app/features/home/logic/doctor_speciality/specializations_cubit.dart';
import 'package:doctors_app/features/home/logic/recommendation_doctors/recommendation_doctors_cubit.dart';
import 'package:doctors_app/features/doctor_details/ui/doctor_details_screen.dart';
import 'package:doctors_app/features/home/ui/home_screen.dart';
import 'package:doctors_app/features/home/ui/see_all_doctor_speciality_screen.dart';
import 'package:doctors_app/features/home/ui/see_all_recommendation_doctors_screen.dart';
import 'package:doctors_app/features/layout/app_layout.dart';
import 'package:doctors_app/features/onboarding/onboarding_screen.dart';
import 'package:doctors_app/features/personal_info/ui/personal_info_screen.dart';
import 'package:doctors_app/features/profile/logic/profile_cubit.dart';
import 'package:doctors_app/features/settings/ui/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppRoutes {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ForgotPasswordCubit>(),
            child: const ForgotPasswordScreen(),
          ),
        );
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<VerifyOtpCubit>(),
            child: const OtpScreen(),
          ),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(),
            child: const ResetPasswordScreen(),
          ),
        );
      case Routes.appLayout:
        return MaterialPageRoute(
          builder: (context) => const AppLayout(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.personalInfoScreen:
        final profileCubit = settings.arguments as ProfileCubit?;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: profileCubit ?? getIt<ProfileCubit>(),
            child: const PersonalInfoScreen(),
          ),
        );
      case Routes.settingsScreen:
        return MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        );
      case Routes.seeAllDoctorSpecialityScreen:
        final specializationsCubit = settings.arguments as SpecializationsCubit;
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: specializationsCubit,
              child: const SeeAllDoctorSpecialityScreen(),
            );
          },
        );
      case Routes.seeAllRecommendationDoctorsScreen:
        // Expecting a Map with specializationsCubit
        final args = settings.arguments as Map<String, dynamic>;
        final specializationsCubit =
            args['specializationsCubit'] as SpecializationsCubit;

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<RecommendationDoctorsCubit>(),
            child: SeeAllRecommendationDoctorsScreen(
              specializationsCubit: specializationsCubit,
            ),
          ),
        );
      case Routes.doctorDetailsScreen:
        final doctorId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<DoctorDetailsCubit>(),
            child: DoctorDetailsScreen(doctorId: doctorId),
          ),
        );
      case Routes.doctorDetailsFullScreenMap:
        final args = settings.arguments as Map<String, dynamic>;
        final location = args['location'] as LatLng;
        final title = args['title'] as String;
        final address = args['address'] as String;

        return MaterialPageRoute(
          builder: (context) => DoctorDetailsFullScreenMap(
            location: location,
            title: title,
            address: address,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
