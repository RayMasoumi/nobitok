import 'package:nobitok/data/models/appointment.dart';

import 'invoice.dart';

class Customer {
  int customerId;
  String customerName;
  String? customerEmail;
  String? customerDescription;
  String customerPhoneNumber;
  String? customerIdCode; //code melli
  String? customerDocumentCode; //shomare parvande
  String customerDateOfBirth;
  List<Appointment>? customerAppointments;
  List<Invoice>? customerInvoices;

  Customer({
    required this.customerId,
    required this.customerName,
    this.customerEmail = '',
    required this.customerPhoneNumber,
    this.customerIdCode = '',
    this.customerDocumentCode = '',
    required this.customerDateOfBirth,
    this.customerAppointments =const [],
    this.customerInvoices =const [],
    this.customerDescription = '',
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerId: json['id'] ?? 0,
      customerName: json['name'] ?? '',
      customerPhoneNumber: json['phoneNumber'] ?? '',
      customerDateOfBirth: json['dateOfBirth'] ?? '',
    );
  }
}
