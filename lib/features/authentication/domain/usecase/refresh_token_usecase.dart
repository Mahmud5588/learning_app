import 'package:learnig_app/features/authentication/domain/entities/token_entities.dart';
import 'package:learnig_app/features/authentication/domain/repository/auth_repository.dart';

class RefreshTokenUseCase {
  AuthRepository authRepository;

  RefreshTokenUseCase({required this.authRepository});

  Future<AccessToken> call({
    required String refreshToken,
  }) async {
    return await authRepository.refreshToken(refreshToken: refreshToken);
  }
}
