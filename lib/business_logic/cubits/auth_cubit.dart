import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/data/models/appointment.dart';
import 'package:nobitok/data/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;

  AuthCubit(
    this.authService,
  ) : super(AuthInitial());

  Future<void> auth(String username, String password) async {
    emit(AuthLoading());

    try {
      final loginResponse = await authService.login(username, password);

      if (loginResponse != null) {
        emit(AuthSuccess(loginResponse));
      } else {
        emit(AuthFailure("Login failed"));
      }
    } catch (e) {
      emit(AuthFailure('$e'));
    } finally {
      emit(AuthLoadingComplete());
    }
  }
}
