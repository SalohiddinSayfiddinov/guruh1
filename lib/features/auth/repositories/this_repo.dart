import 'dart:convert';

import 'package:guruh1/features/auth/models/model_dio.dart';
import 'package:http/http.dart' as http;

class ThisRepo {
  static const String userUrl = 'https://montra-mhys.onrender.com/register';
  Future<void> login(ModelRequest request) async {
    try {
      final reponse = await http.post(
        Uri.parse("$userUrl/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );
      if (reponse.statusCode == 200 || reponse.statusCode == 201) {
        return;
      } else {
        final data = jsonDecode(reponse.body);
        throw data['detail'] ?? 'xatolik';
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> tendOtp(OtpRequest request) async {
    try {
      final response = await http.post(
        Uri.parse("$userUrl/confirim-otp"),
        headers: {"Content=Type": "application/json"},
        body: jsonEncode(request.toJson),
      );
      if (response.statusCode == 400) {
        throw jsonDecode(response.body).toString();
      }
    } catch (e) {}
  }
}
