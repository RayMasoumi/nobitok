import '../data/models/invoice_item.dart';
import '../data/models/service.dart';

List<InvoiceItem> castServicesToInvoiceItems(List<Service> services) {
  return services.map((service) {
    return InvoiceItem(
      invoiceItemServiceId: service.serviceId,
      invoiceItemServiceName: service.serviceName,
      invoiceItemPrice: service.servicePrice,
      invoiceItemQuantity: service.serviceQuantity,
    );
  }).toList();
}
