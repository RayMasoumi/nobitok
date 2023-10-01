import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/data/services/get_details_service.dart';

import '../../data/models/appointment.dart';
import 'get_appointment_detail_state.dart';

class GetAppointmentDetailCubit extends Cubit<GetAppointmentDetailState> {
  final GetDetailsService appointmentDetailService;

  GetAppointmentDetailCubit(this.appointmentDetailService)
      : super(GetAppointmentDetailInitial());

  Future<void> fetchAppointmentDetail(Appointment appointment) async {
    emit(GetAppointmentDetailLoading());

    try {
      final appointmentDetail =
          await appointmentDetailService.getAppointmentDetail(
              appointment.appointmentCustomerId,
              appointment.appointmentInvoiceId!,
              appointment);

      if (appointmentDetail != null) {
        emit(GetAppointmentDetailLoaded(appointmentDetail));
      } else {
        // ! 'get_appointment_detail_error'
        emit(GetAppointmentDetailError(kGetAppointmentDetailException));
      }
    } catch (e) {
      emit(GetAppointmentDetailError('Failed to fetch appointment detail: $e'));
    }
  }
}
