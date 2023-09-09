import '../../constants/appointment_status.dart';

class Appointment {
  int appointmentId;
  DateTime appointmentDate;
  String? appointmentTime;
  String? appointmentDescription;
  int appointmentCustomerId;
  AppointmentStatus appointmentStatus;

  Appointment({
    required this.appointmentId,
    required this.appointmentDate,
    this.appointmentTime,
    this.appointmentDescription,
    required this.appointmentCustomerId,
    required this.appointmentStatus,
  });
}
