// part of 'pre_appointment_detail_cubit.dart';
//
// @immutable
// abstract class PreAppointmentDetailState {}
//
// class PreAppointmentDetailInitial extends PreAppointmentDetailState {
//   final AppointmentDetail? appointmentDetail;
//
//   AppointmentDetailsState({required this.appointmentDetail});
// }
//
// class AppointmentDetailInitial extends AppointmentDetailsState {
//   AppointmentDetailInitial({required super.appointmentDetail}) {
//     debugPrint('AppointmentDetailInitial');
//   }
// }
//
// class AppointmentDetailLoading extends AppointmentDetailsState {
//   AppointmentDetailLoading() : super(appointmentDetail: null) {
//     debugPrint('AppointmentDetailLoading');
//   }
// }
//
// class AppointmentDetailLoaded extends AppointmentDetailsState {
//   AppointmentDetailLoaded({required super.appointmentDetail}) {
//     debugPrint('AppointmentDetailLoaded');
//   }
// }
//
// class AppointmentDetailError extends AppointmentDetailsState {
//   final String error;
//
//   AppointmentDetailError({required this.error})
//       : super(appointmentDetail: null) {
//     debugPrint('AppointmentDetailError:$error');
//   }
// }
