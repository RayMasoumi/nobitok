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
  final List<Appointment> appointments;

  AuthSuccess(this.appointments) {
    debugPrint('authSuccess: $appointments');
  }
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error) {
    debugPrint('authFailure: $error');
  }
}
