import 'dart:convert';

import '../../constants/strings.dart';
import '../services/post_new_appointment_service.dart';

class PostNewAppointmentRepository {
  final PostNewAppointmentService postNewAppointmentService;

  PostNewAppointmentRepository(this.postNewAppointmentService);

  Future<int> sendNewAppointment(
      String date, String time, int customerId) async {
    final response = await postNewAppointmentService.postNewAppointment(
        time, date, customerId);

    if (response.statusCode == 200) {
      return json.decode(response.body)['data']['factorId'];
    } else {
      print('Send New Appointment Status Code: ${response.statusCode}');
      print('Send New Appointment Body: ${response.body}');
      throw Exception('$kSendNewAppointmentException:${response.body}');
    }
  }
}
