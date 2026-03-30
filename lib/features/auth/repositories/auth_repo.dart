import 'dart:convert';

import 'package:guruh1/features/auth/models/auth_dto.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  static const String baseUrl = "https://api-service.fintechhub.uz";
  Future<void> login(LoginRequest request) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );
      if (response.statusCode == 400) {
        final data = jsonDecode(response.body);
        throw data['detail'];
      }
      print(response.statusCode);
    } catch (e) {
      throw 'Xatolik: $e';
    }
  }

  Future<void> register(RegisterRequest request) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/register/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );
      if (response.statusCode == 400) {
        final data = jsonDecode(response.body);
        throw data.toString();
      }
      print(response.statusCode);
    } catch (e, s) {
      print(s);
      print(e);
      throw "Xatolik: $e";
    }
  }
}
