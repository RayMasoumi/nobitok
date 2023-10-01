import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:nobitok/constants/urls.dart';

import '../../constants/strings.dart';
import '../models/appointment.dart';

class PreAppointmentService {
  Future<List<Appointment>> fetchPreAppointments(
      String startDate, String endDate) async {
    final startDateEncoded = Uri.encodeComponent(startDate);
    final endDateEncoded = Uri.encodeComponent(endDate);

    final url = Uri.parse(
        '$kBaseUrl$kGetPreAppointmentsUrl?StartDate=$startDateEncoded&EndDate=$endDateEncoded');

    final headers = {'Authorization': 'Bearer ${GetStorage().read(kTokenBox)}'};

    try {
      final response = await http.get(
        url,
        headers: headers,
      );

// * successful:
      if (response.statusCode == 200) {
        // * get pre-appointments data
        final List<dynamic> preAppointmentData =
            json.decode(response.body)['dataList'];
        // * get pre-appointments list
        final List<Appointment> preAppointments =
            preAppointmentData.map((item) {
          return Appointment.fromJson(item);
        }).toList();

        debugPrint(
            'success in fetchPreAppointments in get_pre_appointment_service.dart');
        return preAppointments;
      } else if (response.statusCode == 401) {
        print(response.statusCode);
        print(response.body);
        throw Exception(
            'Unauthorized: Please check your authentication credentials.');
      } else {
        throw Exception(
            '$kFetchPreAppointmentsDataException:${response.statusCode}');
      }
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }
}
