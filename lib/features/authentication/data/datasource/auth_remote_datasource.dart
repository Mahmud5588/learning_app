import 'package:learnig_app/features/authentication/data/model/api_response_model.dart';
import 'package:learnig_app/features/authentication/data/model/token_model.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResponseModel> registerEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<ApiResponseModel> registerPhone({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
  });

  Future<AccessTokenModel> login({
    required String username,
    required String password,
  });

  Future<ApiResponseModel> logout();

  Future<ApiResponseModel> resetPasswordPhone({required String phone});

  Future<ApiResponseModel> resetPasswordEmail({required String email});

  Future<AccessTokenModel> refreshToken({required String refreshToken});

  Future<ApiResponseModel> otpVerification({
    required String otp,
    required String userId,
  });

  Future<ApiResponseModel> resetPassword({
    required String otp,
    required List<String> newPassword,
    required List<String> confirmPassword,
  });

  Future<ApiResponseModel> grandCode({required String code});
}
