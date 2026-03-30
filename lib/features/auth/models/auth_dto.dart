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
    this.email = "john_wick@gmail.com",
    this.phone = "+998908765677",
    this.fullName = "John Wick",
    this.region = "tashkent",
    this.birthYear = 2000,
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
