import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../../constants/urls.dart';

class GetCustomerDetailsService {
  Future<http.Response> fetchCustomerDetails(int customerId) async {
    final url = Uri.parse('$kBaseUrl$kGetCustomerDetailUrl/$customerId');
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
