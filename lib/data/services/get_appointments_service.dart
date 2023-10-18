import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../../constants/urls.dart';

class GetAppointmentsService {
  Future<http.Response> fetchTodayAppointments() async {
    // * Implement API request to fetch appointments using the token here
    final url = Uri.parse('$kBaseUrl$kGetAllTodayAppointmentsUrl');

    final headers = {
      'Authorization': 'Bearer ${GetStorage().read(kTokenBox)}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(
        url,
        headers: headers,
      );
      return response;
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }

  Future<http.Response> fetchAppointmentsByRange(
      String startDate, String endDate) async {
    final startDateEncoded = Uri.encodeComponent(startDate);
    final endDateEncoded = Uri.encodeComponent(endDate);

    // * Implement API request to fetch appointments using the token here
    final url = Uri.parse(
        '$kBaseUrl$kGetAppointmentsByRange?StartDate=$startDateEncoded&EndDate=$endDateEncoded');

    final headers = {
      'Authorization': 'Bearer ${GetStorage().read(kTokenBox)}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(
        url,
        headers: headers,
      );
      return response;
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }
}
