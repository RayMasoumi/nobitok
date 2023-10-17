import '../data/models/invoice_item.dart';
import '../data/models/service.dart';

List<Service> castInvoiceItemToService(List<InvoiceItem> existingInvoiceItems) {
  return existingInvoiceItems
      .map((item) => Service(
          serviceId: item.invoiceItemServiceId!,
          servicePrice: item.invoiceItemPrice))
      .toList();
}
