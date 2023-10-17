import 'dart:convert';

import 'package:nobitok/data/models/appointment_detail.dart';

import '../../constants/strings.dart';
import '../services/post_new_pre_appointment_service.dart';

class PostNewPreAppointmentRepository {
  final PostNewPreAppointmentService postNewPreAppointmentService;

  PostNewPreAppointmentRepository(this.postNewPreAppointmentService);

  Future<int> sendNewPreAppointment(
      String date, String time, AppointmentDetail appointmentDetail) async {
    final response = await postNewPreAppointmentService.postNewPreAppointment(
        time, date, appointmentDetail);

    if (response.statusCode == 200) {
      return json.decode(response.body)['data']['factorId'];
    } else {
      print('Send New PreAppointment Status Code: ${response.statusCode}');
      print('Send New PreAppointment Body: ${response.body}');
      throw Exception('$kSendNewPreAppointmentException:${response.body}');
    }
  }
}
