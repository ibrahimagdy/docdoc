import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/core/routing/app_routes.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  final AppRoutes appRoutes;
  const DocApp({super.key, required this.appRoutes});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorManger.mainBlue,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorManger.white,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: ColorManger.darkBlue,
            ),
          ),
        ),
        initialRoute:
            isLoggedInUser ? Routes.appLayout : Routes.onBoardingScreen,
        onGenerateRoute: appRoutes.generateRoute,
        navigatorKey: navigatorKey,
      ),
    );
  }
}
