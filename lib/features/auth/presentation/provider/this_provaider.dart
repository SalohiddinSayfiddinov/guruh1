import 'package:flutter/material.dart';

import 'package:guruh1/features/auth/models/model_dio.dart';
import 'package:guruh1/features/auth/repositories/this_repo.dart';

class ThisProvaider with ChangeNotifier {
  bool isLoading = false;
  String? loadingError;
  bool? loadingResult;

  Future<void> login(ModelRequest request) async {
    isLoading = true;
    loadingError = null;
    loadingResult = null;
    notifyListeners();
    try {
      await ThisRepo().login(request);
      loadingResult = true;
    } catch (e) {
      loadingError = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  bool istendOtp = false;
  String? otpError;
  bool? otpResult;

  Future<void> tendOtp(OtpRequest request) async {
    istendOtp = true;
    otpError = null;
    otpResult = null;
    notifyListeners();
    try {
      await ThisRepo().tendOtp(request);
      otpResult = true;
    } catch (e) {
      otpError = e.toString();
    } finally {
      istendOtp = false;
      notifyListeners();
    }
  }
  
}
