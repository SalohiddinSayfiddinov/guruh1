import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/features/auth/models/auth_dto.dart';
import 'package:guruh1/features/auth/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repo;
  AuthCubit({required this.repo}) : super(const AuthInitial());

  Future<void> login(AuthDto dto) async {
    emit(const AuthLoading());
    // try {
    //   await repo.login(dto);
    //   emit(const AuthSuccess(message: 'Successfully logged in'));
    // } catch (e) {
    //   emit(AuthError(message: e.toString()));
    // }
  }

  Future<void> uploadFile(File file) async {
    emit(const AuthLoading());
    try {
      await repo.uploadFile(file);
      emit(const AuthSuccess(message: 'Successfully uploaded the file'));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
