import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/cubic_app.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      //fallbackLocale: Locale('en', 'US'),
      child: CubicApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}
