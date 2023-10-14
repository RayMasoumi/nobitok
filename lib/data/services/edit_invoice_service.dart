import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../../constants/urls.dart';
import '../models/invoice_item.dart';

class EditInvoiceService {
  Future<http.Response> editInvoice(
    int invoiceItemId,
    int quantity,
    int serviceId,
    int price,
    List<InvoiceItem> selectedServices,
  ) async {
// * Implement API request to fetch information using the token here
    final url = Uri.parse('$kBaseUrl$kEditInvoiceUrl');

    final headers = {
      'Authorization': 'Bearer ${GetStorage().read(kTokenBox)}',
      'Content-Type': 'application/json',
    };
    final data = {
      "id": 3,
      "factorItems": [
        {
          "quantity": 3,
          "serviceId": 8,
          "price": 10000,
        }
      ]
    };

    final body = json.encode(data);
    try {
      final response = await http.post(
        url,
        body: body,
        headers: headers,
      );
      return response;
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }
}
