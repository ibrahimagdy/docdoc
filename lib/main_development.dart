import 'package:doctors_app/core/di/dependency_injection.dart';
import 'package:doctors_app/core/routing/app_routes.dart';
import 'package:doctors_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(
    DocApp(
      appRoutes: AppRoutes(),
    ),
  );
}
