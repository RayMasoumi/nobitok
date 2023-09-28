part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {
  AuthInitial() {
    debugPrint('authInitial');
  }
}

class AuthLoading extends AuthState {
  final BuildContext context;
  AuthLoading(this.context) {
    debugPrint('authLoading');
    context.loaderOverlay.show();
  }
}

class AuthLoadingComplete extends AuthState {
  final BuildContext context;

  AuthLoadingComplete(this.context) {
    context.loaderOverlay.hide();
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
