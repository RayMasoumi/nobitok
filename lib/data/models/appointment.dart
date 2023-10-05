import 'package:nobitok/methods/get_appointment_status_from_int.dart';

import '../../constants/enums/appointment_status.dart';

class Appointment {
  int appointmentId;
  String appointmentDate;
  String? appointmentTime;
  String? appointmentDescription;
  int appointmentCustomerId;
  String appointmentCustomerName;
  AppointmentStatus appointmentStatus;
  int? appointmentInvoiceId;
  String? appointmentCustomerPhoneNumber;

  Appointment({
    required this.appointmentId,
    required this.appointmentDate,
    this.appointmentTime,
    this.appointmentDescription,
    this.appointmentInvoiceId,
    this.appointmentCustomerPhoneNumber,
    required this.appointmentCustomerId,
    required this.appointmentStatus,
    required this.appointmentCustomerName,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      appointmentId: json['id'] ?? 0,
      appointmentCustomerId: json['customerId'] ?? 0,
      appointmentDescription: json['description'] ?? '',
      appointmentDate: json['date'] ?? '',
      appointmentTime: json['time'] ?? '',
      appointmentStatus:
          getAppointmentStatusFromInt(json['appointmentStatus'] ?? 3),
      appointmentCustomerName: json['customerName'] ?? '',
      appointmentInvoiceId: json['factorId'] ?? 0,
      appointmentCustomerPhoneNumber: json['phoneNumber'] ?? '',
    );
  }
}
