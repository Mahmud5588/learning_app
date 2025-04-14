import 'package:flutter/material.dart';

import 'core/responsive/app_responsive.dart';
import 'core/route/route_generators.dart';
import 'core/route/route_names.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppResponsive.init(context);
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.firstSplashPage,
      onGenerateRoute: AppRoute(context: context).onGenerateRoute,
    );
  }
}