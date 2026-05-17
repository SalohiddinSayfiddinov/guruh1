import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:guruh1/core/api/api.dart';
import 'package:guruh1/features/auth/models/auth_dto.dart';
import 'package:guruh1/features/auth/models/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<void> login(AuthDto dto) async {
    final storage = const FlutterSecureStorage();

    try {
      final response = await http.post(
        Uri.parse("${Api.baseUrl}/auth/login"),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(dto.toJson()),
      );
      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = AuthModel.fromJson(data).token;
        await storage.write(key: 'token', value: token);
        return;
      }

      throw data.toString();
    } catch (e) {
      rethrow;
    }
  }
}
