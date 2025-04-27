import 'package:flutter_bloc/flutter_bloc.dart' show Bloc;
import 'package:learnig_app/features/authentication/domain/usecase/otp_verification_usecase.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/event.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/otp/otp_state.dart';

class OtpVerificationsBloc extends Bloc<AuthEvent,OtpVerificationState>{
  OtpVerificationUseCase otpVerificationUseCase;
  OtpVerificationsBloc({required this.otpVerificationUseCase}):super(OtpVerificationInitial()){
    on<AuthOtpVerificationEvent>((event,emit)async{
      emit(OtpVerificationsLoading());
      try{
        final response=await otpVerificationUseCase(otp: event.otp,userId: event.userId);
        emit(OtpVerificationsSuccess(message: response.success.toString()));
      }catch(e){
        emit(OtpVerificationsError(message:e.toString()));
      }
    });
  }
}