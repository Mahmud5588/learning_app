import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnig_app/features/authentication/domain/usecase/login_usecase.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/event.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<AuthEvent,LoginState>{
  LoginUseCase loginUseCase;
  LoginBloc({required this.loginUseCase}):super(LoginInitial()){
    on<AuthLoginEvent>((event,emit)async{
      emit(LoginLoading());
      try{
        final response=await loginUseCase.call(username: event.username, password: event.password);
        emit(LoginSuccess(message: response.refreshTokenExpiry));
      }catch(e){
        emit(LoginError(message: e.toString()));
      }
    });
  }
}