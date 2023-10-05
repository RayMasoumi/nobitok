import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/business_logic/cubits/appointment_details_state.dart';
import 'package:nobitok/data/models/appointment.dart';
import 'package:nobitok/data/models/appointment_detail.dart';

import '../../constants/enums/appointment_status.dart';
import '../../constants/strings.dart';
import '../../data/models/customer.dart';
import '../../data/models/invoice.dart';
import '../../data/repositories/get_customer_details_repository.dart';
import '../../data/repositories/get_invoice_details_repository.dart';

class AppointmentDetailCubit extends Cubit<AppointmentDetailsState> {
  final GetCustomerDetailsRepository getCustomerDetailsRepository;
  final GetInvoiceDetailsRepository getInvoiceDetailsRepository;

  AppointmentDetailCubit(
      {required this.getInvoiceDetailsRepository,
      required this.getCustomerDetailsRepository})
      : super(AppointmentDetailInitial(appointmentDetail: null));

  Future<void> fetchAppointmentDetail(Appointment appointment) async {
    emit(AppointmentDetailLoading());

    try {
      final appointmentDetail = await fetchAppointmentDetailFromRepositories(
          appointment.appointmentCustomerId,
          appointment.appointmentInvoiceId!,
          appointment);

      emit(AppointmentDetailLoaded(appointmentDetail: appointmentDetail));
    } catch (e) {
      emit(AppointmentDetailError(
          error: 'Failed to fetch appointment detail: $e'));
    }
  }

  // * set appointment detail
  void setAppointmentDetail(AppointmentDetail appointmentDetail) {
    emit(state);
  }

  // * Get appointments
  AppointmentDetail getAppointmentDetails() {
    return state.appointmentDetail ??
        AppointmentDetail(
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
                appointmentCustomerName: 'appointmentCustomerName'));
  }

  Future<AppointmentDetail> fetchAppointmentDetailFromRepositories(
      int customerId, int invoiceId, Appointment appointmentDetail) async {
    final Customer customerDetail;
    try {
      customerDetail =
          await getCustomerDetailsRepository.fetchCustomerDetails(customerId);
      final Invoice invoiceDetail;
      try {
        invoiceDetail =
            await getInvoiceDetailsRepository.fetchInvoiceDetails(invoiceId);

        return AppointmentDetail(
            invoiceDetail: invoiceDetail,
            customerDetail: customerDetail,
            appointmentDetail: appointmentDetail);
      } catch (e) {
        // ! 'get_invoice_detail_error'
        throw Exception(
            '$kGetInvoiceDetailException:$e:in AppointmentDetailsCubit');
      }
    } catch (e) {
      // ! 'get_customer_detail_error'
      throw Exception(
          '$kGetCustomerDetailException:$e:in AppointmentDetailsCubit');
    }
  }
}
