import 'package:nobitok/data/models/appointment.dart';

import 'invoice.dart';

class Customer {
  int customerId;
  String customerName;
  String? customerEmail;
  String customerPhoneNumber;
  String? customerIdCode;
  String customerPassword;
  String? customerDocumentCode;
  DateTime customerDateOfBirth;
  List<Appointment> customerAppointments;
  List<Invoice> customerInvoices;

  Customer({
    required this.customerId,
    required this.customerName,
    this.customerEmail,
    required this.customerPhoneNumber,
    this.customerIdCode,
    required this.customerPassword,
    this.customerDocumentCode,
    required this.customerDateOfBirth,
    required this.customerAppointments,
    required this.customerInvoices,
  });
}
