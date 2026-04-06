class LoginRequest {
  final String userName;
  final String password;

  const LoginRequest({required this.userName, required this.password});

  Map<String, dynamic> toJson() {
    return {"username": userName, "password": password};
  }
}

class RegisterRequest {
  final String username;
  final String email;
  final String phone;
  final String fullName;
  final String region;
  final int birthYear;
  final String password;

  const RegisterRequest({
    required this.username,
    required this.email,
    required this.phone,
    required this.fullName,
    required this.region,
    required this.birthYear,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "phone": phone,
      "full_name": fullName,
      "region": region,
      "birth_year": birthYear,
      "password": password,
    };
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
