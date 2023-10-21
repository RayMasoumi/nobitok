part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {
  AuthInitial() {
    debugPrint('authInitial');
  }
}

class AuthLoading extends AuthState {
  AuthLoading() {
    debugPrint('authLoading');
  }
}

class AuthLoadingComplete extends AuthState {
  AuthLoadingComplete() {
    debugPrint('authLoadingCompleted');
  }
}

class AuthSuccess extends AuthState {
  AuthSuccess() {
    debugPrint('authSuccess');
  }
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error) {
    debugPrint('authFailure: $error');
  }
}

class RefreshTokenFailure extends AuthState {
  final String error;

  RefreshTokenFailure(this.error) {
    debugPrint('RefreshTokenFailure: $error');
  }
}

class RefreshTokenSuccess extends AuthState {
  RefreshTokenSuccess() {
    debugPrint('RefreshTokenSuccess');
  }
}
