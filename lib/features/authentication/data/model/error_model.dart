import 'package:learnig_app/features/authentication/domain/entities/error_entities.dart';

class ErrorModel extends ErrorEntities {
  ErrorModel({
    required super.code,
    required super.message,
    required super.details,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      code: json['code'],
      message: json['message'],
      details: json['details'],
    );
  }
}
