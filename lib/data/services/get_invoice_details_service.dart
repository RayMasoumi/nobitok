import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../../constants/urls.dart';

class GetInvoiceDetailsService {
  Future<http.Response> fetchInvoiceDetails(int invoiceId) async {
    final url = Uri.parse('$kBaseUrl$kGetInvoiceDetailUrl?Id=$invoiceId');

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
