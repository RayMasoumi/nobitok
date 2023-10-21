import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../../constants/urls.dart';

class DeleteAppointmentService {
  Future<http.Response> deleteAppointment(
    int appointmentId,
  ) async {
    final url = Uri.parse('$kBaseUrl$kDeleteAppointmentUrl?Id=$appointmentId');

    final headers = {
      'Authorization': 'Bearer ${GetStorage().read(kTokenBox)}',
      'Content-Type': 'application/json',
    };

    // * Create a list of factor items from the invoiceItems list

    try {
      final response = await http.delete(
        url,
        headers: headers,
      );
      return response;
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }
}
