abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});
}

class AuthSuccess extends AuthState {
  final String message;

  const AuthSuccess({required this.message});
}
