import 'package:flutter/material.dart';
import 'package:learnig_app/core/route/route_names.dart';
import 'package:learnig_app/features/authentication/presentation/presentation/sign_up/otp.dart';
import 'package:learnig_app/features/home/presentation/pages/bookmark.dart';
import 'package:learnig_app/features/home/presentation/pages/mentors.dart';
import 'package:learnig_app/features/home/presentation/pages/top_courses.dart';

import '../../features/authentication/presentation/presentation/forgot_password/create_new_password.dart';
import '../../features/authentication/presentation/presentation/forgot_password/forgot_password_page.dart';
import '../../features/authentication/presentation/presentation/forgot_password/send_code.dart';
import '../../features/authentication/presentation/presentation/on_borading/first_splash_page.dart';
import '../../features/authentication/presentation/presentation/on_borading/on_boarding_page.dart';
import '../../features/authentication/presentation/presentation/sign_in/login.dart';
import '../../features/authentication/presentation/presentation/sign_in/sign_in.dart';
import '../../features/authentication/presentation/presentation/sign_up/sign_up.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/notifications.dart';
import '../../features/profile/presentation/pages/create_new_pin.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/profile/presentation/pages/set_finger_print.dart';

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.signIn:
        return MaterialPageRoute(builder: (_) => SignIn());

      case RouteNames.signUp:
        return MaterialPageRoute(builder: (_) => SignUp());
      case RouteNames.firstSplashPage:
        return MaterialPageRoute(builder: (_) => FirstSplashPage());
      case RouteNames.onBoarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => Login());
      case RouteNames.forgotPasswordPage:
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      case RouteNames.sendCodePage:
        return MaterialPageRoute(builder: (_) => SendCodePage());
      case RouteNames.createNewPassword:
        return MaterialPageRoute(builder: (_) => CreateNewPassword());
      case RouteNames.profilePage:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case RouteNames.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RouteNames.createNewPin:
        return MaterialPageRoute(builder: (_) => CreateNewPin());
      case RouteNames.setFingerPrint:
        return MaterialPageRoute(builder: (_) => SetFingerPrint());
      case RouteNames.notifications:
        return MaterialPageRoute(builder: (_) => Notifications());
      case RouteNames.bookmark:
        return MaterialPageRoute(builder: (_) => Bookmark());
      case RouteNames.otpPage:
        return MaterialPageRoute(builder: (_) => OtpCodePage());
      case RouteNames.mentors:
        return MaterialPageRoute(builder: (_) => TopMentorsPage());
      case RouteNames.topCourses:
        return MaterialPageRoute(builder: (_) => MostPopularCoursesPage());

      default:
        return _defaultRoute();
    }
  }
}

Route<dynamic> _defaultRoute() {
  return MaterialPageRoute(
    builder: (_) => Scaffold(body: Center(child: Text("Error Route"))),
  );
}
