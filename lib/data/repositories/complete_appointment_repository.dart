import 'package:nobitok/data/models/appointment_detail.dart';
import 'package:nobitok/data/services/complete_appointment_service.dart';

import '../../constants/strings.dart';

class CompleteAppointmentRepository {
  final CompleteAppointmentService completeAppointmentService;

  CompleteAppointmentRepository(this.completeAppointmentService);

  Future<bool> completeAppointment(AppointmentDetail appointmentDetail) async {
    final response =
        await completeAppointmentService.completeAppointment(appointmentDetail);

    if (response.statusCode == 200) {
      return true;
    }
    print('Appointment completed Status Code: ${response.statusCode}');
    print('Appointment completed Body: ${response.body}');
    throw Exception('$kSendNewPreAppointmentException:${response.body}');
  }
}
