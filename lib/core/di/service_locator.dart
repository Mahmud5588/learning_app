import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:learnig_app/core/network/dio_client.dart';
import 'package:learnig_app/features/authentication/data/datasource/auth_remote_datasource.dart';
import 'package:learnig_app/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:learnig_app/features/authentication/domain/usecase/login_usecase.dart';
import 'package:learnig_app/features/authentication/domain/usecase/logout_usecase.dart';
import 'package:learnig_app/features/authentication/domain/usecase/otp_verification_usecase.dart';
import 'package:learnig_app/features/authentication/domain/usecase/register_email_usecase.dart';
import 'package:learnig_app/features/authentication/domain/usecase/register_phone_usecase.dart';
import 'package:learnig_app/features/authentication/domain/usecase/reset_email_usecase.dart';
import 'package:learnig_app/features/authentication/domain/usecase/reset_password_usecase.dart';
import 'package:learnig_app/features/authentication/domain/usecase/reset_phone_usecase.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/otp/otp_bloc.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/refreshToken/refresh_bloc.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/register/register_bloc.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/resetPassword/reset_passsword_bloc.dart';
import '../../features/authentication/data/datasource/auth_remote_datasource_imp.dart';
import '../../features/authentication/domain/repository/auth_repository.dart';

final sl = GetIt.instance;

Future<void> setUp() async {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioClient(sl()));

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  ///UseCases
  sl.registerLazySingleton<RegisterEmailUseCase>(
    () => RegisterEmailUseCase(authRepository: sl()),
  );
  sl.registerLazySingleton<RegisterPhoneUseCase>(
    () => RegisterPhoneUseCase(authRepository: sl()),
  );
  sl.registerLazySingleton<ResetPasswordPhoneUseCase>(
    () => ResetPasswordPhoneUseCase(authRepository: sl()),
  );
  sl.registerLazySingleton<ResetPasswordEmailUseCase>(
    () => ResetPasswordEmailUseCase(authRepository: sl()),
  );
  sl.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(authRepository: sl()),
  );
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepository: sl()),
  );
  sl.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(authRepository: sl()),
  );
  sl.registerLazySingleton<OtpVerificationUseCase>(
    () => OtpVerificationUseCase(authRepository: sl()),
  );

  //Bloc
  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));
  sl.registerFactory(() => OtpVerificationsBloc(otpVerificationUseCase: sl()));
  sl.registerFactory(
    () => RegisterBloc(registerEmailUseCase: sl(), registerPhoneUseCase: sl()),
  );
  sl.registerFactory(
    () => ResetPasswordBloc(
      resetPasswordUseCase: sl(),
      resetPasswordEmailUseCase: sl(),
      resetPasswordPhoneUseCase: sl(),
    ),
  );
  sl.registerFactory(() => RefreshTokenBloc(refreshTokenUseCase: sl()));
}
