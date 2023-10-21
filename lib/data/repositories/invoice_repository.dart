import 'package:nobitok/data/services/edit_invoice_service.dart';

import '../../constants/strings.dart';
import '../models/invoice_item.dart';

class InvoiceRepository {
  final EditInvoiceService editInvoiceService;

  InvoiceRepository({required this.editInvoiceService});

  Future<bool> editInvoice(
      int invoiceId, List<InvoiceItem> invoiceItems) async {
    final response =
        await editInvoiceService.editInvoice(invoiceId, invoiceItems);
    if (response.statusCode == 200) {
      return true;
    } else {
// ! error'
      throw Exception('$kEditInvoiceException:${response.statusCode}');
    }
  }
}
