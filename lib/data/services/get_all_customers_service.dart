import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../../constants/urls.dart';

class GetAllCustomersService {
  Future<http.Response> getAllCustomers() async {
// * Implement API request to fetch information using the token here
    final url = Uri.parse('$kBaseUrl$kGetAllCustomersUrl');
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
