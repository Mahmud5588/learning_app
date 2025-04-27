import 'package:learnig_app/features/authentication/domain/entities/api_response.dart';
import 'package:learnig_app/features/authentication/domain/repository/auth_repository.dart';

class RegisterPhoneUseCase {
  AuthRepository authRepository;

  RegisterPhoneUseCase({required this.authRepository});

  Future<ApiResponse> call({
    required String firstName,
    required String lastName,
    required String password,
    required String phoneNumber,
  }) async {
    return await authRepository.registerPhone(
      firstName: firstName,
      lastName: lastName,
      password: password,
      phoneNumber: phoneNumber,
    );
  }
}
