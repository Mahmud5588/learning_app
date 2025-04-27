import 'package:learnig_app/features/authentication/domain/entities/user_entites.dart';

class UserModel extends UserEntities {
  UserModel({
    required super.uuid,
    required super.firstName,
    required super.lastName,
    required super.userName,
    required super.phoneNumber,
    required super.password,
    required super.email,
    required super.roles,
    required super.skillOccupation,
    required super.biography,
    required super.registrationData,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uuid: json['uuid'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      userName: json['userName'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      email: json['email'],
      roles: json['roles'],
      skillOccupation: json['skillOccupation'],
      biography: json['biography'],
      registrationData: json['registrationData'],

    );
  }
}
