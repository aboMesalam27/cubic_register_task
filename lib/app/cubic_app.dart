import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/routing/app_router.dart';
import '../core/routing/routes.dart';

class CubicApp extends StatelessWidget {
  final AppRouter appRouter;
  const CubicApp({super.key,required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        title: "Cubic App",
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}

class TestResponsive extends StatefulWidget {
  const TestResponsive({super.key});

  @override
  State<TestResponsive> createState() => _TestResponsiveState();
}

class _TestResponsiveState extends State<TestResponsive> {
  @override
  Widget build(BuildContext context) {
    final currentWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: currentWidth<600?Colors.orange:Colors.blue,
      body: Center(
        child: Text(currentWidth.toString()),
      ),
    );
  }
}
