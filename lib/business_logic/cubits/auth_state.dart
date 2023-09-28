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
  final List<Appointment> appointments;

  AuthSuccess(this.appointments) {
    print('authSuccess: $appointments');
  }
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error) {
    debugPrint('authFailure: $error');
    if (error.contains(kServerException)) {
      // todo show internet alert
      print('server exception');
    } else if (error.contains('$kAuthException:401')) {
      // todo show wrong username or password alert
      print('auth exception');
    } else if (error.contains(kFetchTodayAppointmentsDataException)) {
      // todo
      print('fetch today appointment');
    } else {
      // todo default alert
      print('an exception');
    }
  }
}
