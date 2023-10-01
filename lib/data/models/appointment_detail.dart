import 'package:nobitok/data/models/appointment.dart';
import 'package:nobitok/data/models/invoice.dart';

import 'customer.dart';

class AppointmentDetail {
  final Invoice invoiceDetail;
  final Customer customerDetail;
  final Appointment appointmentDetail;

  const AppointmentDetail({
    required this.invoiceDetail,
    required this.customerDetail,
    required this.appointmentDetail,
  });
}
