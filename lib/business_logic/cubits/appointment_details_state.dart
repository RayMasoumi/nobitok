import 'package:flutter/cupertino.dart';

import '../../data/models/appointment_detail.dart';

abstract class AppointmentDetailsState {
  final AppointmentDetail? appointmentDetail;

  AppointmentDetailsState({required this.appointmentDetail});
}

class AppointmentDetailInitial extends AppointmentDetailsState {
  AppointmentDetailInitial({required super.appointmentDetail}) {
    debugPrint('AppointmentDetailInitial');
  }
}

class AppointmentDetailLoading extends AppointmentDetailsState {
  AppointmentDetailLoading() : super(appointmentDetail: null) {
    debugPrint('AppointmentDetailLoading');
  }
}

class AppointmentDetailSent extends AppointmentDetailsState {
  AppointmentDetailSent() : super(appointmentDetail: null) {
    debugPrint('AppointmentDetailSent');
  }
}

class AppointmentDetailEdited extends AppointmentDetailsState {
  AppointmentDetailEdited() : super(appointmentDetail: null) {
    debugPrint('AppointmentDetailEdited');
  }
}

class AppointmentDetailLoaded extends AppointmentDetailsState {
  AppointmentDetailLoaded({required super.appointmentDetail}) {
    debugPrint('AppointmentDetailLoaded');
  }
}

class CompletedAppointmentDetailLoaded extends AppointmentDetailsState {
  CompletedAppointmentDetailLoaded({required super.appointmentDetail}) {
    debugPrint('CompletedAppointmentDetailLoaded');
  }
}

class AppointmentDetailError extends AppointmentDetailsState {
  final String error;

  AppointmentDetailError({required this.error})
      : super(appointmentDetail: null) {
    debugPrint('AppointmentDetailError:$error');
  }
}
