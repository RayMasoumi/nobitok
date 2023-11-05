import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../../constants/urls.dart';

class GetAllPaymentsService {
  Future<http.Response> fetchAllPaymentsService() async {
    // * Implement API request to fetch services using the token here
    final url = Uri.parse('$kBaseUrl$kGetAllPaymentsUrl');

    final headers = {
      'Authorization': 'Bearer ${GetStorage().read(kTokenBox)}',
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

  Future<http.Response> fetchPaymentsByRange(
      String startDate, String endDate) async {
    final startDateEncoded = Uri.encodeComponent(startDate);
    final endDateEncoded = Uri.encodeComponent(endDate);

    // * Implement API request to fetch payments using the token here
    final url = Uri.parse(
        '$kBaseUrl$kGetPaymentsByRangeUrl?startDate=$startDateEncoded&endDate=$endDateEncoded');

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
