import 'package:doctors_app/core/di/dependency_injection.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/features/auth/forgot_password/logic/forgot_password_cubit.dart';
import 'package:doctors_app/features/auth/forgot_password/ui/forgot_password_screen.dart';
import 'package:doctors_app/features/auth/login/logic/login_cubit.dart';
import 'package:doctors_app/features/auth/login/ui/login_screen.dart';
import 'package:doctors_app/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:doctors_app/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:doctors_app/features/home/ui/home_screen.dart';
import 'package:doctors_app/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
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
