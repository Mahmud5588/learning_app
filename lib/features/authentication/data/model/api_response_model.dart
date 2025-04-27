import 'package:learnig_app/features/authentication/domain/entities/api_response.dart';


class ApiResponseModel extends ApiResponse {
  ApiResponseModel({
    required super.success,
    required super.errors,
    required super.message,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      success: json['success'],
      errors: json['errors'],
      message: json['message'],
    );
  }
}
