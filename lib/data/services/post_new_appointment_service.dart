import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../../constants/urls.dart';

class PostNewAppointmentService {
  Future<http.Response> postNewAppointment(
      String time, String date, int customerId) async {
// * Implement API request to send information using the token here
    final url = Uri.parse('$kBaseUrl$kPostNewPreAppointmentUrl');

    final headers = {
      'Authorization': 'Bearer ${GetStorage().read(kTokenBox)}',
      'Content-Type': 'application/json',
    };

    final body = {
      "date": date,
      "time": time,
      "description": '',
      "customerId": customerId,
      "userId": 0,
      "status": 1,
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
