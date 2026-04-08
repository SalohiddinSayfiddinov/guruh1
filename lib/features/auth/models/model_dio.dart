class ModelRequest {
  final String name;
  final String email;
  final String password;

  const ModelRequest({
    required this.name,
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "password": password};
  }
}

class OtpRequest {
  final String email;
  final String code;

  OtpRequest({required this.email, required this.code});

  Map<String, dynamic> toJson() {
    return {"email": email, "code": code};
  }
}
class LoginRequest {
  final String name;
  final String password;

  const LoginRequest({required this.name, required this.password});

  Map<String, dynamic> toJson() {
    return {"username": name, "password": password};
  }
}
