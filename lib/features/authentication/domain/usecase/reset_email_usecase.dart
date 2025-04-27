import 'package:learnig_app/features/authentication/domain/entities/api_response.dart';
import 'package:learnig_app/features/authentication/domain/repository/auth_repository.dart';

class ResetPasswordEmailUseCase{
  AuthRepository authRepository;
  ResetPasswordEmailUseCase({required this.authRepository});
  Future<ApiResponse> call({required String email})async{
    return await authRepository.resetPasswordEmail(email: email);
  }
}