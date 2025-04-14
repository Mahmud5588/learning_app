import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learnig_app/core/color/app_color.dart';
import '../../../../../core/route/route_names.dart';
import '../../../../../core/responsive/app_responsive.dart';

class FirstSplashPage extends StatefulWidget {
  const FirstSplashPage({super.key});

  @override
  State<FirstSplashPage> createState() => _FirstSplashPageState();
}

class _FirstSplashPageState extends State<FirstSplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteNames.onBoarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Scaffold(
      backgroundColor: AppColor.disabledButton,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: appHeight(30),
                child: Image.asset("assets/images/logo.png"),
              ),
              SizedBox(height: appHeight(10)),
              SpinKitCircle(color: AppColor.white, size: appWidth(10)),
            ],
          ),
        ),
      ),
    );
  }
}
