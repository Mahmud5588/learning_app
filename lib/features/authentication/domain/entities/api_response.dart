
import 'error_entities.dart';

class ApiResponse{
  final bool success;
  final dynamic data;
  final ErrorEntities errors;
  final String message;
  ApiResponse({required this.success,this.data, required this.errors, required this.message});
}