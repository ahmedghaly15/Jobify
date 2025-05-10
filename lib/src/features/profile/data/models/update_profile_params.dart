class UpdateProfileParams {
  final String? email, password, phone;
  final Map<String, dynamic>? data;

  UpdateProfileParams({
    required this.email,
    required this.password,
    required this.phone,
    required this.data,
  });
}
