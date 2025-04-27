import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnig_app/features/authentication/domain/usecase/refresh_token_usecase.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/event.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/refreshToken/refresh_state.dart';

class RefreshTokenBloc extends Bloc<AuthEvent,RefreshTokenState>{
  RefreshTokenUseCase refreshTokenUseCase;
  RefreshTokenBloc({required this.refreshTokenUseCase}):super(RefreshTokenInitial()){
    on<AuthRefreshTokenEvent>((event,emit)async{
      emit(RefreshTokenLoading());
      try{
        final response=await refreshTokenUseCase.call(refreshToken: event.refreshToken);
        emit(RefreshTokenSuccess(message: response.refreshToken));
      }catch(e){
        emit(RefreshTokenError(message: e.toString()));
      }
    });
  }
}