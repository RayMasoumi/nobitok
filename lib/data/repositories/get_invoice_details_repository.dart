import 'dart:convert';

import 'package:nobitok/data/services/get_invoice_details_service.dart';

import '../../constants/strings.dart';
import '../models/invoice.dart';
import '../models/invoice_item.dart';

class GetInvoiceDetailsRepository {
  final GetInvoiceDetailsService getInvoiceDetailsService;

  GetInvoiceDetailsRepository({required this.getInvoiceDetailsService});

  Future<Invoice> fetchInvoiceDetails(int invoiceId) async {
    final response =
        await getInvoiceDetailsService.fetchInvoiceDetails(invoiceId);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      final factorItems = jsonResponse['data']['factorItems'];
      final invoiceItems = (factorItems as List<dynamic>)
          .map((item) => InvoiceItem.fromJson(item))
          .toList();
      final invoice = Invoice(
          invoiceId: jsonResponse['data']['id'],
          invoiceDate: jsonResponse['data']['date'],
          isPaid: jsonResponse['data']['isPaid'],
          customerId: jsonResponse['data']['customerId'],
          appointmentId: jsonResponse['data']['appointmentId'],
          invoiceTotal: jsonResponse['data']['total'],
          invoiceItems: invoiceItems);
      return invoice;
    } else {
      // ! 'get_invoice_detail_error'
      throw Exception('$kGetInvoiceDetailException:${response.statusCode}');
    }
  }
}
