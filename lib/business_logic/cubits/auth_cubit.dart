import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user.dart';
import '../../data/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService; // Your authentication service

  AuthCubit(this.authService) : super(AuthInitial());

  Future<void> auth(String username, String password) async {
    emit(AuthLoading());

    try {
      final loginResponse = await authService.login(username, password);

      emit(AuthSuccess(loginResponse!));

      // After a successful login and user info fetch, you can navigate to the main screen.
      // For example, use Navigator or any navigation package.
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
