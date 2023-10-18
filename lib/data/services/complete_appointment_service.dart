import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:nobitok/data/models/appointment_detail.dart';

import '../../constants/strings.dart';
import '../../constants/urls.dart';

class CompleteAppointmentService {
  Future<http.Response> completeAppointment(
      AppointmentDetail appointmentDetail) async {
// * Implement API request to send information using the token here
    final url = Uri.parse('$kBaseUrl$kCompleteAppointmentUrl');

    final headers = {
      'Authorization': 'Bearer ${GetStorage().read(kTokenBox)}',
      'Content-Type': 'application/json',
    };

    final body = {
      "id": appointmentDetail.appointmentDetail.appointmentId,
      "customerId": appointmentDetail.customerDetail.customerId,
      "appointmentStatusId": 2,
      "date": appointmentDetail.appointmentDetail.appointmentDate,
      "time": appointmentDetail.appointmentDetail.appointmentTime,
      "description": ""
    };
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );
      return response;
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }
}
