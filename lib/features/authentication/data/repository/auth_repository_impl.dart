import 'package:learnig_app/features/authentication/data/datasource/auth_remote_datasource.dart';
import 'package:learnig_app/features/authentication/domain/entities/api_response.dart';
import 'package:learnig_app/features/authentication/domain/entities/token_entities.dart';
import 'package:learnig_app/features/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);


  //Auth Login
  @override
  Future<AccessToken> authLogin({
    required String username,
    required String password,
  }) async {
    return authRemoteDataSource.login(username: username, password: password);
  }


  //Logout
  @override
  Future<ApiResponse> logout() async {
    return authRemoteDataSource.logout();
  }


  //Otp Verifications
  @override
  Future<ApiResponse> otpVerifications({required String otp, required String userId}) async {
    return authRemoteDataSource.otpVerification(otp: otp, userId: userId);
  }


  //Refresh Token
  @override
  Future<AccessToken> refreshToken({required String refreshToken}) async {
    return authRemoteDataSource.refreshToken(refreshToken: refreshToken);
  }


  //Register Email
  @override
  Future<ApiResponse> registerEmail({
    required String firstName,
    required String lastName,
    required String password,
    required String email,
  }) {
    return authRemoteDataSource.registerEmail(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }


  //Register Phone
  @override
  Future<ApiResponse> registerPhone({
    required String firstName,
    required String lastName,
    required String password,
    required String phoneNumber,
  }) {
    return authRemoteDataSource.registerPhone(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      password: password,
    );
  }


  //Reset Password
  @override
  Future<ApiResponse> resetPasswordEmail({required email}) async {
    return authRemoteDataSource.resetPasswordEmail(email: email);
  }


  //Reset Password Phone
  @override
  Future<ApiResponse> resetPasswordPhone({required phone}) async {
    return authRemoteDataSource.resetPasswordPhone(phone: phone);
  }


  //Grant Code
  @override
  Future<ApiResponse> grandCode({required String code}) async {
    return authRemoteDataSource.grandCode(code: code);
  }


  //Reset Password
  @override
  Future<ApiResponse> resetPassword({
    required String otp,
    required List<String> newPassword,
    required List<String> confirmPassword,
  }) async {
    return authRemoteDataSource.resetPassword(
      otp: otp,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
  }
}
