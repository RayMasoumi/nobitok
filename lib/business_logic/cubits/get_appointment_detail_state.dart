import 'package:flutter/cupertino.dart';

import '../../data/models/appointment_detail.dart';

abstract class GetAppointmentDetailState {}

class GetAppointmentDetailInitial extends GetAppointmentDetailState {
  GetAppointmentDetailInitial() {
    debugPrint('AppointmentDetailInitial');
  }
}

class GetAppointmentDetailLoading extends GetAppointmentDetailState {
  GetAppointmentDetailLoading() {
    debugPrint('AppointmentDetailLoading');
  }
}

class GetAppointmentDetailLoaded extends GetAppointmentDetailState {
  final AppointmentDetail appointmentDetail;

  GetAppointmentDetailLoaded(this.appointmentDetail) {
    debugPrint('AppointmentDetailLoaded');
  }
}

class GetAppointmentDetailError extends GetAppointmentDetailState {
  final String error;

  GetAppointmentDetailError(this.error) {
    debugPrint('AppointmentDetailError:$error');
  }
}
