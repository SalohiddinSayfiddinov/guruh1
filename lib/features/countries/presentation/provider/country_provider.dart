import 'package:flutter/material.dart';
import 'package:guruh1/features/countries/model/country_model.dart';
import 'package:guruh1/features/countries/repository/country_repo.dart';

class CountryProvider extends ChangeNotifier {
  bool isLoading = false;
  String? error;
  List<Country> countries = [];

  Future<void> getCountries() async {
    isLoading = true;
    error = null;
    countries.clear();
    notifyListeners();
    try {
      final response = await CountryRepo().getCountries();
      countries = response;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
