import 'package:learnig_app/features/authentication/domain/entities/api_response.dart';
import 'package:learnig_app/features/authentication/domain/repository/auth_repository.dart';

class OtpVerificationUseCase {
  AuthRepository authRepository;

  OtpVerificationUseCase({required this.authRepository});

  Future<ApiResponse> call({required String otp, required String userId}) async {
    return await authRepository.otpVerifications(otp: otp, userId: userId);
  }
}
