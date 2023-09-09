class InvoiceItem {
  int invoiceItemId;
  int? invoiceId;
  int? invoiceItemServiceId;
  double invoiceItemPrice;
  String? invoiceItemDescription;
  int invoiceItemQuantity;

  InvoiceItem({
    required this.invoiceItemId,
    this.invoiceId,
    this.invoiceItemServiceId,
    required this.invoiceItemPrice,
    this.invoiceItemDescription,
    required this.invoiceItemQuantity,
  });
}
