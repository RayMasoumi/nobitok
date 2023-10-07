// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// import '../../data/repositories/get_customer_details_repository.dart';
// import '../../data/repositories/get_invoice_details_repository.dart';
// import 'appointment_details_state.dart';
//
// part 'pre_appointment_detail_state.dart';
//
// class PreAppointmentDetailCubit extends Cubit<PreAppointmentDetailState> {
//   final GetCustomerDetailsRepository getCustomerDetailsRepository;
//   final GetInvoiceDetailsRepository getInvoiceDetailsRepository;
//
//   PreAppointmentDetailCubit(
//       {required this.getInvoiceDetailsRepository,
//       required this.getCustomerDetailsRepository})
//       : super(PreAppointmentDetailInitial(preAppointmentDetail: null));
//
//   Future<void> fetchPreAppointmentDetail(Appointment appointment) async {
//     emit(PreAppointmentDetailLoading());
//
//     try {
//       final preAppointmentDetail = await fetchAppointmentDetailFromRepositories(
//           appointment.appointmentCustomerId,
//           appointment.appointmentInvoiceId!,
//           appointment);
//
//       emit(AppointmentDetailLoaded(appointmentDetail: appointmentDetail));
//     } catch (e) {
//       emit(AppointmentDetailError(
//           error: 'Failed to fetch appointment detail: $e'));
//     }
//   }
//
//   // * set appointment detail
//   void setAppointmentDetail(AppointmentDetail appointmentDetail) {
//     emit(state);
//   }
//
//   // * Get appointments
//   AppointmentDetail getAppointmentDetails() {
//     return state.appointmentDetail ??
//         AppointmentDetail(
//             invoiceDetail: Invoice(
//                 invoiceId: 0,
//                 invoiceDate: '',
//                 isPaid: true,
//                 customerId: 0,
//                 appointmentId: 0,
//                 invoiceTotal: 0,
//                 invoiceItems: []),
//             customerDetail: Customer(
//                 customerId: 0,
//                 customerName: '',
//                 customerPhoneNumber: 'customerPhoneNumber',
//                 customerDateOfBirth: 'customerDateOfBirth',
//                 customerAppointments: [],
//                 customerInvoices: []),
//             appointmentDetail: Appointment(
//                 appointmentId: 0,
//                 appointmentDate: 'appointmentDate',
//                 appointmentCustomerId: 0,
//                 appointmentStatus: AppointmentStatus.appointment,
//                 appointmentCustomerName: 'appointmentCustomerName'));
//   }
//
//   Future<AppointmentDetail> fetchAppointmentDetailFromRepositories(
//       int customerId, int invoiceId, Appointment appointmentDetail) async {
//     final Customer customerDetail;
//     try {
//       customerDetail =
//           await getCustomerDetailsRepository.fetchCustomerDetails(customerId);
//       final Invoice invoiceDetail;
//       try {
//         invoiceDetail =
//             await getInvoiceDetailsRepository.fetchInvoiceDetails(invoiceId);
//
//         return AppointmentDetail(
//             invoiceDetail: invoiceDetail,
//             customerDetail: customerDetail,
//             appointmentDetail: appointmentDetail);
//       } catch (e) {
//         // ! 'get_invoice_detail_error'
//         throw Exception(
//             '$kGetInvoiceDetailException:$e:in AppointmentDetailsCubit');
//       }
//     } catch (e) {
//       // ! 'get_customer_detail_error'
//       throw Exception(
//           '$kGetCustomerDetailException:$e:in AppointmentDetailsCubit');
//     }
//   }
// }
