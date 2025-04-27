import 'package:learnig_app/features/authentication/domain/entities/token_entities.dart';
import 'package:learnig_app/features/authentication/domain/entities/api_response.dart';

abstract class AuthRepository{


  //RESET PASSWORD
  Future<ApiResponse> resetPassword({
    required String otp,
    required List<String> newPassword,
    required List<String> confirmPassword,
  });

  //RESET PASSWORD PHONE
  Future<ApiResponse> resetPasswordPhone({required phone});


  //RESET PASSWORD EMAIL
  Future<ApiResponse> resetPasswordEmail({required String email});

  Future<ApiResponse> registerPhone({
    required String firstName,
    required String lastName,
    required String password,
    required String phoneNumber,
  });



  //REGISTER EMAIL
  Future<ApiResponse> registerEmail({
    required String firstName,
    required String lastName,
    required String password,
    required String email,
  });


  //REFRESH TOKEN
  Future<AccessToken> refreshToken({required String refreshToken});

  //OTP VERIFICATIONS
  Future<ApiResponse> otpVerifications({required String otp,required String userId});

  //LOGOUT
  Future<ApiResponse> logout();


  //LOGIN
  Future<AccessToken> authLogin({
    required String username,
    required String password,
  });

  //GRAND CODE
  Future<ApiResponse> grandCode({required String code});
}
