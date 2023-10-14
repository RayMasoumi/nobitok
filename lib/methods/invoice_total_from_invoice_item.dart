import '../data/models/invoice_item.dart';

double invoiceTotalFromInvoiceItem(List<InvoiceItem> invoiceItems) {
  double total = 0;
  for (InvoiceItem item in invoiceItems) {
    total += item.invoiceItemPrice;
  }
  return total;
}
