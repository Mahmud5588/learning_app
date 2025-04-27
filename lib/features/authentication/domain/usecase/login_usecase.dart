import 'package:learnig_app/features/authentication/domain/entities/token_entities.dart';
import 'package:learnig_app/features/authentication/domain/repository/auth_repository.dart';

class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  Future<AccessToken>call({required String username,required String password})async{
    return await authRepository.authLogin(username: username, password: password);
  }
}