import 'package:nobitok/data/services/edit_invoice_service.dart';

import '../../constants/strings.dart';
import '../models/invoice_item.dart';

class InvoiceRepository {
  final EditInvoiceService editInvoiceService;

  InvoiceRepository({required this.editInvoiceService});

  Future<bool> editInvoice(int invoiceItemId, int quantity, int serviceId,
      int price, List<InvoiceItem> selectedServices) async {
    final response = await editInvoiceService.editInvoice(
        invoiceItemId, quantity, serviceId, price, selectedServices);
    if (response.statusCode == 200) {
      // TODO ?? anything i should do?
      return true;
    } else {
// ! error'
      throw Exception('$kEditInvoiceException:${response.statusCode}');
    }
  }
}
