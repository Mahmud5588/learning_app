import 'package:learnig_app/features/authentication/domain/entities/api_response.dart';
import 'package:learnig_app/features/authentication/domain/repository/auth_repository.dart';

class LogoutUseCase{
  AuthRepository authRepository;
  LogoutUseCase({required this.authRepository});
  Future<ApiResponse>call()async{
    return authRepository.logout();
  }
}