import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class ThemeProvider extends ChangeNotifier {
  final box = Hive.box('myBox');

  bool _darkMode = false;

  ThemeMode get mode => _darkMode ? ThemeMode.dark : ThemeMode.light;

  void changeMode(bool mode) {
    _darkMode = mode;
    notifyListeners();
  }

  void initMode() {
    _darkMode = box.get('darkMode', defaultValue: true);
  }
}
