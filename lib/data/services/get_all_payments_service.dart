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
      print('im hereeee in get all payments service line 21, request sent');

      return response;
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }
}
