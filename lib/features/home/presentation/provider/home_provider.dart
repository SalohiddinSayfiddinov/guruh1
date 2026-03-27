import 'package:flutter/material.dart';
import 'package:guruh1/features/home/models/electronics_model.dart';
import 'package:guruh1/features/home/repository/electronics_repository.dart';

class HomeProvider extends ChangeNotifier {
  bool isGetting = false;
  String? error;
  List<ElectronicsModel> electronics = [];

  bool isCreating = false;
  String? createError;
  bool? isCreated;

  void getElectronics() async {
    error = null;
    electronics.clear();
    isGetting = true;
    notifyListeners();
    try {
      final data = await ElectronicsRepository().getElectronics();
      electronics = data;
    } catch (e) {
      error = e.toString();
    } finally {
      isGetting = false;
      notifyListeners();
    }
  }

  Future<void> createGadget(ElectronicsModel gadget) async {
    isCreating = true;
    createError = null;
    isCreated = null;
    notifyListeners();
    try {
      await ElectronicsRepository().createElectronics(gadget);
      isCreated = true;
    } catch (e) {
      createError = error;
    } finally {
      isCreating = false;
      notifyListeners();
    }
  }
}
