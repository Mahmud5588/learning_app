import 'package:learnig_app/features/authentication/domain/entities/api_response.dart';
import 'package:learnig_app/features/authentication/domain/repository/auth_repository.dart';

class ResetPasswordUseCase {
  AuthRepository authRepository;

  ResetPasswordUseCase({required this.authRepository});

  Future<ApiResponse> call({required String otp, required List<
      String> confirmPassword, required List<String> newPassword})async{
    return await authRepository.resetPassword(otp: otp, newPassword: newPassword, confirmPassword: confirmPassword);
  }
}