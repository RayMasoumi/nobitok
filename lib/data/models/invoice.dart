import 'package:nobitok/methods/invoice_total_from_invoice_item.dart';

import 'invoice_item.dart';

class Invoice {
  int invoiceId;
  String invoiceDate;
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

  factory Invoice.fromJson(Map<String, dynamic> json) {
    List<InvoiceItem> factorItems = [];
    if (json['factorItems'] != null) {
      factorItems = List<InvoiceItem>.from(
        json['factorItems'].map((item) => InvoiceItem.fromJson(item)),
      );
    }

    return Invoice(
      invoiceId: json['id'],
      isPaid: json['isPaid'],
      customerId: json['customerId'],
      invoiceDate: json['date'],
      invoiceItems: factorItems,
      appointmentId: 0,
      invoiceTotal: invoiceTotalFromInvoiceItem(factorItems),
    );
  }
}
