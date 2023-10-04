import 'dart:convert';

import 'package:nobitok/data/models/appointment.dart';
import 'package:nobitok/data/services/get_appointments_service.dart';

import '../../constants/strings.dart';

class GetAppointmentsRepository {
  final GetAppointmentsService getAppointmentsService;

  GetAppointmentsRepository({required this.getAppointmentsService});

  Future<List<Appointment>> fetchTodayAppointments() async {
    final response = await getAppointmentsService.fetchTodayAppointments();
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> dataList = jsonResponse['dataList'];
      List<Appointment> appointments = dataList.map((data) {
        return Appointment.fromJson(data);
      }).toList();
      return appointments;
    } else {
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      throw Exception(
//! fetch_today_appointments_error
          '$kFetchTodayAppointmentsDataException:${response.body}');
    }
  }
}
