import 'invoice_item.dart';

class Invoice {
  int invoiceId;
  DateTime invoiceDate;
  bool isPaid;
  int customerId;
  int appointmentId;
  double invoiceTotal;
  List<InvoiceItem> invoiceItems;

  Invoice({
    required this.invoiceId,
    required this.invoiceDate,
    required this.isPaid,
    required this.customerId,
    required this.appointmentId,
    required this.invoiceTotal,
    required this.invoiceItems,
  });
}
