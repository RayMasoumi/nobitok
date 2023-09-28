import 'package:nobitok/constants/enums/appointment_status.dart';

AppointmentStatus getAppointmentStatusFromInt(int status) {
  switch (status) {
    case 0:
      return AppointmentStatus.preAppointment;
    case 1:
      return AppointmentStatus.appointment;
    case 2:
      return AppointmentStatus.completed;
    default:
      return AppointmentStatus.canceled;
  }
}
