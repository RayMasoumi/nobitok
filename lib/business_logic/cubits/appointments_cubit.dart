import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/appointment.dart';

class AppointmentsCubit extends Cubit<Map<String, List<Appointment>>> {
  AppointmentsCubit() : super({});

  // * Add a list of appointments with a given key
  // * the keys are stored in strings under the name of appointment keys
  void addAppointments(String key, List<Appointment> appointments) {
    final state = Map.of(this.state);
    state[key] = appointments;
    emit(state);
  }

  // * Get appointments for a specific key
  List<Appointment> getAppointments(String key) {
    final appointments = state[key];
    return appointments ?? [];
  }

  // * Remove appointments for a specific key
  void clearAppointments(String key) {
    final state = Map.of(this.state);
    state[key] = [];
    emit(state);
  }
}
