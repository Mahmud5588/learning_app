import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnig_app/features/authentication/domain/usecase/register_email_usecase.dart';
import 'package:learnig_app/features/authentication/domain/usecase/register_phone_usecase.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/event.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/register/register_state.dart';

class RegisterBloc extends Bloc<AuthEvent, RegisterState> {
  RegisterPhoneUseCase registerPhoneUseCase;
  RegisterEmailUseCase registerEmailUseCase;

  RegisterBloc({
    required this.registerPhoneUseCase,
    required this.registerEmailUseCase,
  }) : super(RegisterInitial()) {
    on<AuthRegisterEmailEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        final registerEmail = registerEmailUseCase.call(
          firstName: event.firstName,
          lastName: event.lastName,
          password: event.password,
          email: event.email,
        );
        emit(RegisterSuccess(message: registerEmail.toString()));
      } catch (e) {
        emit(RegisterError(message: e.toString()));
      }
    });
    on<AuthRegisterPhoneEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        final registerPhone = registerPhoneUseCase(
          firstName: event.firstName,
          lastName: event.lastName,
          password: event.password,
          phoneNumber: event.phoneNumber,
        );
        emit(RegisterSuccess(message: registerPhone.toString()));
      } catch (e) {
        emit(RegisterError(message: e.toString()));
      }
    });
  }
}
