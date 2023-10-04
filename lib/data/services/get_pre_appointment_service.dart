import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:nobitok/constants/urls.dart';

import '../../constants/strings.dart';

class GetPreAppointmentService {
  Future<http.Response> getAllPreAppointments(
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
      return response;
    } catch (error) {
      // * couldn't send request(e.g no internet)
      throw Exception('$kServerException:$error');
    }
  }
}
