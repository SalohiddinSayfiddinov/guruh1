import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:guruh1/core/api/api.dart';
import 'package:guruh1/features/products/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsRepo {
  Future<List<ProductModel>> getProducts() async {
    final storage = const FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    try {
      final headers = {'accept': 'application/json'};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
      final response = await http.get(
        Uri.parse("${Api.baseUrl}/products"),
        headers: headers,
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return (data as List).map((e) => ProductModel.fromJson(e)).toList();
      }
      throw data.toString();
    } catch (e) {
      rethrow;
    }
  }
}
