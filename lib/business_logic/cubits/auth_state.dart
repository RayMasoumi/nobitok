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
    print('authLoading');
  }
}

class AuthSuccess extends AuthState {
  final User user;

  AuthSuccess(this.user) {
    print('authSuccess: $user');
  }
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error) {
    print('authFailure: $error');
  }
}
