class ErrorEntities{
  final String code;
  final Map<String, dynamic> details;
  final String message;
  ErrorEntities({
    required this.code,
    required this.message,
    required this.details,
  });
}