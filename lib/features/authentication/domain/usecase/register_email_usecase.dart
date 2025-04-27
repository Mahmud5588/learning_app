import 'package:learnig_app/features/authentication/domain/entities/api_response.dart';
import 'package:learnig_app/features/authentication/domain/repository/auth_repository.dart';

class RegisterEmailUseCase {
  AuthRepository authRepository;

  RegisterEmailUseCase({required this.authRepository});

  Future<ApiResponse> call({
    required String firstName,
    required String lastName,
    required String password,
    required String email,
  }) async {
    return await authRepository.registerEmail(
      firstName: firstName,
      lastName: lastName,
      password: password,
      email: email
    );
  }
}
