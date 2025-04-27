import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnig_app/features/authentication/domain/usecase/reset_email_usecase.dart';
import 'package:learnig_app/features/authentication/domain/usecase/reset_password_usecase.dart';
import 'package:learnig_app/features/authentication/domain/usecase/reset_phone_usecase.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/event.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/resetPassword/reset_password_state.dart';

class ResetPasswordBloc extends Bloc<AuthEvent, ResetPasswordState> {
  final ResetPasswordEmailUseCase resetPasswordEmailUseCase;
  final ResetPasswordPhoneUseCase resetPasswordPhoneUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordBloc({
    required this.resetPasswordEmailUseCase,
    required this.resetPasswordPhoneUseCase,
    required this.resetPasswordUseCase,
  }) : super(ResetPasswordInitial()) {

    on<AuthResetPasswordEmailEvent>((event, emit) async {
      emit(ResetPasswordLoading());
      try {
        final response = await resetPasswordEmailUseCase(email: event.email);
        emit(ResetPasswordSuccess(message: response.success.toString()));
      } catch (e) {
        emit(ResetPasswordError(message: e.toString()));
      }
    });


    on<AuthResetPasswordPhoneEvent>((event, emit) async {
      emit(ResetPasswordLoading());
      try {
        final response = await resetPasswordPhoneUseCase(phone: event.phone);
        emit(ResetPasswordSuccess(message: response.success.toString()));
      } catch (e) {
        emit(ResetPasswordError(message: e.toString()));
      }
    });

    on<AuthResetPasswordEvent>((event, emit) async {
      emit(ResetPasswordLoading());
      try {
        final response = await resetPasswordUseCase(
          otp: event.otp,
          newPassword: event.newPassword,
          confirmPassword: event.confirmPassword,
        );
        emit(ResetPasswordSuccess(message: response.success.toString()));
      } catch (e) {
        emit(ResetPasswordError(message: e.toString()));
      }
    });
  }
}
