import 'package:doctors_app/core/di/dependency_injection.dart';
import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/core/routing/app_routes.dart';
import 'package:doctors_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(
    DocApp(
      appRoutes: AppRoutes(),
    ),
  );
}

checkIfLoggedInUser() async {
  bool isFirstTime = await SharedPrefHelper.getBool(SharedPrefKeys.isFirstTime,
      defaultValue: true);

  if (isFirstTime) {
    await SharedPrefHelper.clearAllSecuredData();
    await SharedPrefHelper.setData(SharedPrefKeys.isFirstTime, false);
    isLoggedInUser = false;
    return;
  }

  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
