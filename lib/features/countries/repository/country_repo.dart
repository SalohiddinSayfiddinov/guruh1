import 'dart:convert';

import 'package:guruh1/features/countries/model/country_model.dart';
import 'package:http/http.dart' as http;

class CountryRepo {
  Future<List<Country>> getCountries() async {
    try {
      final response = await http.get(
        Uri.parse("https://api.sampleapis.com/countries/countries"),
        headers: {'Accept': 'application/json'},
      );
      final List data = jsonDecode(response.body);
      return data.map((e) => Country.fromJson(e)).toList();
    } catch (e, s) {
      print(s);
      throw "Xatolik: $e";
    }
  }
}
