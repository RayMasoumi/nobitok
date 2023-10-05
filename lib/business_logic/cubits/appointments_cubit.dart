import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/appointment.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit() : super(AppointmentsState(allAppointments: {}));

  // * Add a list of appointments with a given key
  // * the keys are stored in strings under the name of appointment keys
  void addAppointments(String key, List<Appointment> appointments) {
    state.allAppointments[key] = appointments;
    emit(state);
  }

  // * Get appointments for a specific key
  List<Appointment> getAppointments(String key) {
    final appointments = state.allAppointments[key];
    return appointments ?? [];
  }

  // * Remove appointments for a specific key
  void clearAppointments(String key) {
    state.allAppointments[key] = [];
    emit(state);
  }
}
