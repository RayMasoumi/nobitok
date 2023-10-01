class InvoiceItem {
  int invoiceItemId;
  int? invoiceId;
  int? invoiceItemServiceId;
  String? invoiceItemServiceName;
  double invoiceItemPrice;
  String? invoiceItemDescription;
  int invoiceItemQuantity;

  InvoiceItem({
    required this.invoiceItemId,
    this.invoiceId,
    this.invoiceItemServiceName,
    this.invoiceItemServiceId,
    required this.invoiceItemPrice,
    this.invoiceItemDescription,
    required this.invoiceItemQuantity,
  });

  factory InvoiceItem.fromJson(Map<String, dynamic> json) {
    return InvoiceItem(
      invoiceItemId: json['id'],
      invoiceId: json['factorId'],
      invoiceItemServiceId: json['serviceId'],
      invoiceItemServiceName: json['serviceName'],
      invoiceItemPrice: json['price'],
      invoiceItemQuantity: json['quantity'],
      invoiceItemDescription: json['description'],
    );
  }
}
