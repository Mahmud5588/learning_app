import 'package:learnig_app/features/authentication/domain/entities/user_entites.dart';
import 'package:learnig_app/features/authentication/domain/entities/api_response.dart';

class AccessToken {
  final String accessToken;
  final String accessTokenExpiry;
  final String refreshToken;
  final String refreshTokenExpiry;
  final UserEntities userEntities;


  AccessToken({
    required this.accessToken,
    required this.accessTokenExpiry,
    required this.refreshToken,
    required this.refreshTokenExpiry,
    required this.userEntities,
  });
}
