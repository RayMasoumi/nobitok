import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../data/models/user.dart';
import '../../data/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService; // * authentication service
  final BuildContext context;
  AuthCubit(this.authService, this.context) : super(AuthInitial());

  Future<void> auth(String username, String password) async {
    emit(AuthLoading(context));

    try {
      final loginResponse = await authService.login(username, password);

      emit(AuthSuccess(loginResponse!));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    } finally {
      emit(AuthLoadingComplete(context));
    }
  }
}
