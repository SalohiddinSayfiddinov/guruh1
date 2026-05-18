import 'dart:convert';
import 'dart:io';

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

  Future<void> uploadFile(File file) async {
    try {
      final uri = Uri.parse('https://api.escuelajs.co/api/v1/files/upload');
      final request = http.MultipartRequest('POST', uri);
      // request.headers['Authorization'] = 'Bearer //';
      // request.fields['first_name'] = 'first name';
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          file.path,
          filename: 'fintech',
        ),
      );
      final streamedResponse = await request.send();

      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        return;
      }
      throw 'Failed to upload an image';
    } catch (e) {
      rethrow;
    }
  }
}
