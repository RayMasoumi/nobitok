import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../../constants/urls.dart';

class GetAllServicesService {
  Future<http.Response> fetchAllServicesService() async {
    // * Implement API request to fetch services using the token here
    final url = Uri.parse('$kBaseUrl$kGetAllServicesUrl');

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
}
