import 'dart:convert';

import 'package:guruh1/features/home/models/electronics_model.dart';
import 'package:http/http.dart' as http;

class ElectronicsRepository {
  Future<List<ElectronicsModel>> getElectronics() async {
    try {
      final response = await http.get(
        Uri.parse("https://68a9cff5b115e67576ec277d.mockapi.io/electronics"),
        headers: {"Accept": "application/json"},
      );
      final List data = jsonDecode(response.body);
      return data.map((e) => ElectronicsModel.fromJson(e)).toList();
    } catch (e, s) {
      print(e);
      print("#" * 20);
      print(s);
      throw "Ma'lumotlarni yuklashda xatolik yuz berdi";
    }
  }

  Future<void> createElectronics(ElectronicsModel gadget) async {
    try {
      await http.post(
        Uri.parse("https://68a9cff5b115e67576ec277d.mockapi.io/electronics"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(gadget.toJson()),
      );
    } catch (e) {
      throw "Ma'lumotlarni yuklashda xatolik yuz berdi";
    }
  }
}
