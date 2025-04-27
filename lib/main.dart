import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/otp/otp_bloc.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/refreshToken/refresh_bloc.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/register/register_bloc.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/resetPassword/reset_passsword_bloc.dart';

import 'app.dart';
import 'core/di/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<LoginBloc>()),
        BlocProvider(create: (context) => sl<RegisterBloc>()),
        BlocProvider(create: (context) => sl<ResetPasswordBloc>()),
        BlocProvider(create: (context) => sl<OtpVerificationsBloc>()),
        BlocProvider(create: (context) => sl<RefreshTokenBloc>()),
      ],
      child: MyApp(),
    ),
  );
}
