class SupabaseErrorModel {
  final String message;
  final String? code;
  final int? statusCode;

  SupabaseErrorModel({required this.message, this.code, this.statusCode});
}
