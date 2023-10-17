import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../../constants/urls.dart';
import '../models/invoice_item.dart';

class EditInvoiceService {
  Future<http.Response> editInvoice(
    int invoiceId,
    List<InvoiceItem> invoiceItems,
  ) async {
    final url = Uri.parse('$kBaseUrl$kEditInvoiceUrl');

    final headers = {
      'Authorization': 'Bearer ${GetStorage().read(kTokenBox)}',
      'Content-Type': 'application/json',
    };

    // * Create a list of factor items from the invoiceItems list
    final factorItems = invoiceItems.map((item) {
      return {
        "quantity": item.invoiceItemQuantity,
        "serviceId": item.invoiceItemServiceId,
        "price": item.invoiceItemPrice,
      };
    }).toList();

    final data = {
      "id": invoiceId,
      "factorItems": factorItems,
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
