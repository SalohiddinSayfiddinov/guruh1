import 'dart:convert';

import 'package:guruh1/features/auth/models/auth_dto.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      final data = jsonDecode(response.body);
      final token = data['tokens']['access'];
      // print(response.body);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
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
      print(response.body);
    } catch (e, s) {
      print(s);
      print(e);
      throw "Xatolik: $e";
    }
  }

  Future<void> sendOtp(OtpRequest request) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/otp-verify/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );
      if (response.statusCode == 400) {
        throw jsonDecode(response.body).toString();
      }
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      throw "Xatolik: $e";
    }
  }
}
