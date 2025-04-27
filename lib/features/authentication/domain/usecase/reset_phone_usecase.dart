import 'package:learnig_app/features/authentication/domain/entities/api_response.dart';
import 'package:learnig_app/features/authentication/domain/repository/auth_repository.dart';

class ResetPasswordPhoneUseCase{
  AuthRepository authRepository;
  ResetPasswordPhoneUseCase({required this.authRepository});
  Future<ApiResponse> call({required String phone})async{
    return await authRepository.resetPasswordPhone(phone: phone);
  }
}