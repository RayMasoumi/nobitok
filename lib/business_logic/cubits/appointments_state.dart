import 'package:flutter/cupertino.dart';

import '../../data/models/appointment.dart';

class AppointmentsState {
  final Map<String, List<Appointment>>? allAppointments;

  AppointmentsState({required this.allAppointments});
}

class AppointmentsInitialState extends AppointmentsState {
  AppointmentsInitialState({required super.allAppointments}) {
    debugPrint('Appointments Initial state');
  }
}

class AppointmentsLoading extends AppointmentsState {
  AppointmentsLoading({required super.allAppointments}) {
    debugPrint('appointments loading state');
  }
}

class AppointmentsLoadingCompleted extends AppointmentsState {
  AppointmentsLoadingCompleted({super.allAppointments}) {
    debugPrint('appointments loading completed state');
  }
}

class AppointmentsLoadingFailed extends AppointmentsState {
  String error;
  AppointmentsLoadingFailed(
      {required this.error, required super.allAppointments}) {
    debugPrint('appointments loading failed state : $error');
  }
}
