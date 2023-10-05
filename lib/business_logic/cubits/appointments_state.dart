import 'package:flutter/cupertino.dart';

import '../../data/models/appointment.dart';

class AppointmentsState {
  final Map<String, List<Appointment>>? allAppointments;

  AppointmentsState({this.allAppointments});
}

class AppointmentsInitialState extends AppointmentsState {
  AppointmentsInitialState() {
    debugPrint('Appointments Initial state');
  }
}

class AppointmentsLoading extends AppointmentsState {
  AppointmentsLoading() {
    debugPrint('appointments loading state');
  }
}

class AppointmentsLoadingCompleted extends AppointmentsState {
  AppointmentsLoadingCompleted() {
    debugPrint('appointments loading completed state');
  }
}

class AppointmentsLoadingFailed extends AppointmentsState {
  AppointmentsLoadingFailed() {
    debugPrint('appointments loading failed state');
  }
}
