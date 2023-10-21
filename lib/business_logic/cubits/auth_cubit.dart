import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/data/repositories/auth_repository.dart';
import 'package:nobitok/data/repositories/get_appointments_repository.dart';
import 'package:nobitok/data/repositories/refresh_token_repository.dart';

import '../../constants/strings.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  final GetAppointmentsRepository getAppointmentsRepository;
  final RefreshTokenRepository refreshTokenRepository;

  AuthCubit(
    this.authRepository,
    this.getAppointmentsRepository, {
    required this.refreshTokenRepository,
  }) : super(AuthInitial());

  Future<void> auth(String username, String password) async {
    emit(AuthLoading());

    try {
      final loginResponse = await login(username, password);

      loginResponse
          ? emit(AuthSuccess())
          : emit(AuthFailure('couldn\'t sign in'));
    } catch (e) {
      emit(AuthFailure('$e'));
    } finally {
      emit(AuthLoadingComplete());
    }
  }

  Future<bool> refreshToken() async {
    emit(AuthLoading());

    try {
      final response = await refreshTokenByRepository();

      if (response) {
        emit(RefreshTokenSuccess());
        return true;
      } else {
        emit(RefreshTokenFailure('couldn\'t refresh token'));
        return false;
      }
    } catch (e) {
      emit(RefreshTokenFailure('$e'));
      return false;
    } finally {
      emit(AuthLoadingComplete());
    }
  }

  // * for login we need tokens and all today's appointments
  Future<bool> login(String username, String password) async {
    // * login API call to get a token

    int authStatusCode = await authRepository.getToken(username, password);

    if (authStatusCode == 200) {
      return true;
    } else {
      throw Exception('$kAuthException:$authStatusCode');
    }
  }

  Future<bool> refreshTokenByRepository() async {
    bool status;
    try {
      status = await refreshTokenRepository.refreshToken();
      return status;
    } catch (e) {
      throw Exception(e);
    }
  }
}
