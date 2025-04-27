import 'package:learnig_app/features/authentication/data/model/user_model.dart';
import 'package:learnig_app/features/authentication/domain/entities/token_entities.dart';


class AccessTokenModel extends AccessToken {
  AccessTokenModel({
    required super.accessToken,
    required super.accessTokenExpiry,
    required super.refreshToken,
    required super.refreshTokenExpiry,
    required super.userEntities,
  });

  factory AccessTokenModel.fromJson(Map<String, dynamic> json){
    return AccessTokenModel(
      accessToken: json['accessToken'],
      accessTokenExpiry: DateTime.parse(json['accessTokenExpiry']) as String,
      refreshToken: json['refreshToken'],
      refreshTokenExpiry: DateTime.parse(json['refreshTokenExpiry']) as String,
      userEntities: UserModel.fromJson(json['user']),
    );
  }
}