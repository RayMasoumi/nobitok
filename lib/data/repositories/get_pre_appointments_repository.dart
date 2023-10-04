import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:nobitok/data/services/get_pre_appointment_service.dart';

import '../../constants/strings.dart';
import '../models/appointment.dart';

class PreAppointmentRepository {
  final GetPreAppointmentService service;

  PreAppointmentRepository({required this.service});

  Future<List<Appointment>> fetchPreAppointments(
      String startDate, String endDate) async {
    final response = await service.getAllPreAppointments(startDate, endDate);
// * successful:
    if (response.statusCode == 200) {
      // * get pre-appointments data
      final List<dynamic> preAppointmentData =
          json.decode(response.body)['dataList'];
      // * get pre-appointments list
      final List<Appointment> preAppointments = preAppointmentData.map((item) {
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
  }
}
