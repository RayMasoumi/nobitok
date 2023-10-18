import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/constants/strings.dart';

import '../../data/models/appointment.dart';
import '../../data/repositories/get_appointments_repository.dart';
import '../../data/repositories/get_pre_appointments_repository.dart';
import 'appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  GetAppointmentsRepository getAppointmentsRepository;
  PreAppointmentRepository preAppointmentRepository;

  AppointmentsCubit(
      {required this.preAppointmentRepository,
      required this.getAppointmentsRepository})
      : super(AppointmentsState(allAppointments: {}));

  Future<void> fetchAppointmentsByRange(
      String startDate, String endDate) async {
    List<Appointment> newAppointments;

    Map<String, List<Appointment>>? allAppointments = state.allAppointments;
    emit(AppointmentsLoading(allAppointments: allAppointments));

    try {
      newAppointments =
          await _fetchAppointmentsByDateFromRepository(startDate, endDate);

      addAppointments(kAppointmentsKey, newAppointments);

      emit(
          AppointmentsLoadingCompleted(allAppointments: state.allAppointments));
    } catch (e) {
      emit(AppointmentsLoadingFailed(
          error: '$e in appointments cubit', allAppointments: allAppointments));
    }
  }

  Future<void> fetchPreAppointmentsByRange(
      String startDate, String endDate) async {
    List<Appointment> newPreAppointments;

    Map<String, List<Appointment>>? allAppointments = state.allAppointments;
    emit(AppointmentsLoading(allAppointments: allAppointments));

    try {
      newPreAppointments =
          await _fetchPreAppointmentsByDateFromRepository(startDate, endDate);

      addAppointments(kPreAppointmentsKey, newPreAppointments);

      emit(
          AppointmentsLoadingCompleted(allAppointments: state.allAppointments));
    } catch (e) {
      emit(AppointmentsLoadingFailed(
          error: '$e in appointments cubit', allAppointments: allAppointments));
    }
  }

  // * Add a list of appointments with a given key
  // * the keys are stored in strings under the name of appointment keys
  void addAppointments(String key, List<Appointment> appointments) {
    state.allAppointments?[key] = appointments;
    emit(state);
  }

  // * Get appointments for a specific key
  List<Appointment> getAppointments(String key) {
    final appointments = state.allAppointments?[key];
    return appointments ?? [];
  }

  // * Remove appointments for a specific key
  void clearAppointments(String key) {
    state.allAppointments?[key] = [];
    emit(state);
  }

  Future<List<Appointment>> _fetchAppointmentsByDateFromRepository(
      String startDate, String endDate) async {
    List<Appointment> appointments;
    try {
      appointments = await getAppointmentsRepository.fetchAppointmentsByRange(
          startDate, endDate);
      return appointments;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Appointment>> _fetchPreAppointmentsByDateFromRepository(
      String startDate, String endDate) async {
    List<Appointment> appointments;
    try {
      appointments = await preAppointmentRepository.fetchPreAppointmentsByRange(
          startDate, endDate);
      return appointments;
    } catch (e) {
      throw Exception(e);
    }
  }
}
