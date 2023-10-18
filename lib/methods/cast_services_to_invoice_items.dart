import '../data/models/invoice_item.dart';
import '../data/models/service.dart';

List<InvoiceItem> castServicesToInvoiceItems(List<Service> services) {
  for (Service service in services) {
    print('%%%%%');
    print(service.serviceQuantity);
  }
  return services.map((service) {
    return InvoiceItem(
      invoiceItemServiceId: service.serviceId,
      invoiceItemServiceName: service.serviceName,
      invoiceItemPrice: service.servicePrice,
      invoiceItemQuantity: service.serviceQuantity,
    );
  }).toList();
}
