class AuthRequestParams {
  final String email, password;
  final String? name;

  AuthRequestParams({required this.email, required this.password, this.name});
}
