import 'package:nobitok/data/models/appointment_detail.dart';

import '../../constants/strings.dart';
import '../services/add_appointment_from_pre_appointment_service.dart';

class AddAppointmentFromPreAppointmentRepository {
  final AddAppointmentFromPreAppointmentService
      adAppointmentFromPreAppointmentService;

  AddAppointmentFromPreAppointmentRepository(
      this.adAppointmentFromPreAppointmentService);

  Future<bool> sendNewAppointment(AppointmentDetail appointmentDetail) async {
    final response = await adAppointmentFromPreAppointmentService
        .postNewAppointment(appointmentDetail);

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Send New Appointment Status Code: ${response.statusCode}');
      print('Send New Appointment Body: ${response.body}');
      throw Exception('$kSendNewAppointmentException:${response.body}');
    }
  }
}
