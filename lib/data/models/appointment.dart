import '../../constants/enums/appointment_status.dart';

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

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      appointmentId: json['id'] ?? 0,
      appointmentCustomerId: json['customerId'] ?? 0,
      appointmentDescription: json['description'] ?? '',
      appointmentDate: DateTime.parse(json['date'] ?? DateTime.now()),
      appointmentTime: json['time'] ?? '',
      appointmentStatus:
          json['appointmentStatus'] ?? AppointmentStatus.appointment,
    );
  }
}
