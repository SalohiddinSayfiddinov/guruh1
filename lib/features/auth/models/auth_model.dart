class AuthModel {
  final String token;

  const AuthModel({required this.token});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(token: json['access_token']);
  }
}
