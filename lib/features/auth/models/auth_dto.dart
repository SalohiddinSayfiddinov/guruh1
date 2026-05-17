class AuthDto {
  final String email;
  final String password;

  const AuthDto({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}
