import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/data/models/appointment.dart';
import 'package:nobitok/data/repositories/auth_repository.dart';
import 'package:nobitok/data/repositories/get_appointments_repository.dart';

import '../../constants/strings.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  final GetAppointmentsRepository getAppointmentsRepository;

  AuthCubit(
    this.authRepository,
    this.getAppointmentsRepository,
  ) : super(AuthInitial());

  Future<void> auth(String username, String password) async {
    emit(AuthLoading());

    try {
      final loginResponse = await login(username, password);

      emit(AuthSuccess(loginResponse));
    } catch (e) {
      emit(AuthFailure('$e'));
    } finally {
      emit(AuthLoadingComplete());
    }
  }

  Future<List<Appointment>> login(String username, String password) async {
    // * Your login API call to get a token

    int authStatusCode = await authRepository.getToken(username, password);

    if (authStatusCode == 200) {
      // * Fetch user information using the token
      return await getAppointmentsRepository.fetchTodayAppointments();
    } else {
      throw Exception('$kAuthException:$authStatusCode');
    }
  }
}
