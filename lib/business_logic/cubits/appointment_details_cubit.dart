import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/constants/enums/appointment_status.dart';
import 'package:nobitok/data/models/appointment.dart';
import 'package:nobitok/data/models/appointment_detail.dart';
import 'package:nobitok/data/models/customer.dart';
import 'package:nobitok/data/models/invoice.dart';

class AppointmentDetailCubit extends Cubit<AppointmentDetail> {
  AppointmentDetailCubit()
      : super(AppointmentDetail(
            invoiceDetail: Invoice(
                invoiceId: 0,
                invoiceDate: '',
                isPaid: true,
                customerId: 0,
                appointmentId: 0,
                invoiceTotal: 0,
                invoiceItems: []),
            customerDetail: Customer(
                customerId: 0,
                customerName: '',
                customerPhoneNumber: 'customerPhoneNumber',
                customerDateOfBirth: 'customerDateOfBirth',
                customerAppointments: [],
                customerInvoices: []),
            appointmentDetail: Appointment(
                appointmentId: 0,
                appointmentDate: 'appointmentDate',
                appointmentCustomerId: 0,
                appointmentStatus: AppointmentStatus.appointment,
                appointmentCustomerName: 'appointmentCustomerName')));

  // * set appointment detail
  void setAppointmentDetail(AppointmentDetail appointmentDetail) {
    emit(appointmentDetail);
  }

  // * Get appointments
  AppointmentDetail getAppointmentDetails() {
    return state;
  }
}
