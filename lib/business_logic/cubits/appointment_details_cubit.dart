import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/business_logic/cubits/appointment_details_state.dart';
import 'package:nobitok/data/models/appointment.dart';
import 'package:nobitok/data/models/appointment_detail.dart';
import 'package:nobitok/data/repositories/add_appointment_from_pre_appointment_repository.dart';
import 'package:nobitok/data/repositories/complete_appointment_repository.dart';
import 'package:nobitok/data/repositories/invoice_repository.dart';

import '../../constants/enums/appointment_status.dart';
import '../../constants/strings.dart';
import '../../data/models/customer.dart';
import '../../data/models/invoice.dart';
import '../../data/repositories/get_customer_details_repository.dart';
import '../../data/repositories/get_invoice_details_repository.dart';
import '../../data/repositories/post_new_pre_appointment_repository.dart';

class AppointmentDetailCubit extends Cubit<AppointmentDetailsState> {
  final GetCustomerDetailsRepository getCustomerDetailsRepository;
  final GetInvoiceDetailsRepository getInvoiceDetailsRepository;

  final InvoiceRepository invoiceRepository;
  final PostNewPreAppointmentRepository postNewPreAppointmentRepository;
  final AddAppointmentFromPreAppointmentRepository
      addAppointmentFromPreAppointmentRepository;
  final CompleteAppointmentRepository completeAppointmentRepository;
  AppointmentDetailCubit(
      {required this.completeAppointmentRepository,
      required this.invoiceRepository,
      required this.addAppointmentFromPreAppointmentRepository,
      required this.postNewPreAppointmentRepository,
      required this.getInvoiceDetailsRepository,
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

  // * new pre appointment
  Future<void> createPreAppointment(String date, String time) async {
    AppointmentDetail appointmentDetail = getAppointmentDetails();

    emit(AppointmentDetailLoading());
    try {
      final sent = await sendNewPreAppointmentToRepository(
          date, time, appointmentDetail);

      sent
          ? emit(AppointmentDetailSent())
          : emit(AppointmentDetailError(
              error: 'could not send the pre appointment'));
    } catch (e) {
      emit(AppointmentDetailError(
          error: 'Failed to send pre appointment detail: $e'));
    }
  }

  // * new appointment from pre appointment
  Future<void> createAppointmentFromPreAppointment() async {
    AppointmentDetail appointmentDetail = getAppointmentDetails();
    emit(AppointmentDetailLoading());

    try {
      final sent = await sendNewAppointmentToRepository(appointmentDetail);

      sent
          ? emit(AppointmentDetailSent())
          : emit(
              AppointmentDetailError(error: 'could not send the appointment'));
    } catch (e) {
      emit(AppointmentDetailError(
          error: 'Failed to send appointment detail: $e'));
    }
  }

  // complete appointment
  Future<void> completeTheAppointment() async {
    AppointmentDetail appointmentDetail = getAppointmentDetails();
    emit(AppointmentDetailLoading());

    try {
      final sent = await completeAppointmentOfRepository(appointmentDetail);

      sent
          ? emit(AppointmentDetailSent())
          : emit(AppointmentDetailError(
              error: 'could not complete the appointment'));
    } catch (e) {
      emit(AppointmentDetailError(
          error: 'Failed to complete appointment detail: $e'));
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

  Future<bool> sendNewPreAppointmentToRepository(
      String date, String time, AppointmentDetail appointmentDetail) async {
    final int factorId;
    try {
      factorId = await postNewPreAppointmentRepository.sendNewPreAppointment(
          date, time, appointmentDetail);

      final bool factorStatusCode;
      try {
        factorStatusCode = await invoiceRepository.editInvoice(
            factorId, appointmentDetail.invoiceDetail.invoiceItems);

        return factorStatusCode;
      } catch (e) {
        // ! 'send_new_pre_appointment_error'
        throw Exception('$e:in AppointmentDetailsCubit');
      }
    } catch (e) {
      // ! 'send_new_pre_appointment_error'
      throw Exception('$e:in AppointmentDetailsCubit');
    }
  }

  Future<bool> sendNewAppointmentToRepository(
      AppointmentDetail appointmentDetail) async {
    try {
      await addAppointmentFromPreAppointmentRepository
          .sendNewAppointment(appointmentDetail);

      final bool factorStatusCode;
      try {
        factorStatusCode = await invoiceRepository.editInvoice(
            appointmentDetail.invoiceDetail.invoiceId,
            appointmentDetail.invoiceDetail.invoiceItems);

        return factorStatusCode;
      } catch (e) {
        // ! 'send_new_appointment_error'
        throw Exception('$e:in AppointmentDetailsCubit');
      }
    } catch (e) {
      // ! 'send_new_appointment_error'
      throw Exception('$e:in AppointmentDetailsCubit');
    }
  }

  Future<bool> completeAppointmentOfRepository(
      AppointmentDetail appointmentDetail) async {
    bool status;
    try {
      status = await completeAppointmentRepository
          .completeAppointment(appointmentDetail);

      return status;
    } catch (e) {
      // ! 'complete_appointment_error'
      throw Exception('$e:in AppointmentDetailsCubit');
    }
  }
}
