import 'package:flutter/material.dart';
import 'package:guruh1/features/auth/models/auth_dto.dart';
import 'package:guruh1/features/auth/repositories/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  bool loggingIn = false;
  String? loginError;
  bool? loginResult;

  Future<void> login(LoginRequest request) async {
    loggingIn = true;
    loginError = null;
    loginResult = null;
    notifyListeners();
    try {
      await AuthRepo().login(request);
      loginResult = true;
    } catch (e) {
      loginError = e.toString();
    } finally {
      loggingIn = false;
      notifyListeners();
    }
  }

  bool registering = false;
  String? registerError;
  bool? registerResult;

  Future<void> register(RegisterRequest request) async {
    registering = true;
    registerError = null;
    registerResult = null;
    notifyListeners();
    try {
      await AuthRepo().register(request);
      registerResult = true;
    } catch (e) {
      registerError = e.toString();
    } finally {
      registering = false;
      notifyListeners();
    }
  }

  bool isSendingOtp = false;
  String? otpError;
  bool? otpResult;

  Future<void> sendOtp(OtpRequest request) async {
    isSendingOtp = true;
    otpError = null;
    otpResult = null;
    notifyListeners();
    try {
      await AuthRepo().sendOtp(request);
      otpResult = true;
    } catch (e) {
      otpError = e.toString();
    } finally {
      isSendingOtp = false;
      notifyListeners();
    }
  }
}
