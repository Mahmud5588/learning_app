import 'package:flutter/material.dart';

import 'core/route/route_generators.dart';
import 'core/route/route_names.dart' show RouteNames;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.homePage,
      onGenerateRoute: AppRoute(context: context).onGenerateRoute,
    );
  }
}
