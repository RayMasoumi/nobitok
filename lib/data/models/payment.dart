class Payment {
  Payment({
    required this.paymentId,
    required this.paymentAmount,
    required this.paymentDate,
    required this.paymentTime,
    required this.paymentType,
    required this.paymentInvoiceId,
    required this.paymentCustomerId,
    required this.paymentCustomerName,
  });
  int paymentId;
  double paymentAmount;
  String paymentDate;
  String paymentTime;
  int paymentType;
  int paymentInvoiceId;
  int paymentCustomerId;
  String paymentCustomerName;

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentId: json['id'] ?? 0,
      paymentAmount: json['paidAmount'] ?? 0,
      paymentDate: json['payDate'] ?? '',
      paymentTime: json['payTime'] ?? '',
      paymentType: json['paymentType'] ?? 0,
      paymentInvoiceId: json['factorId'] ?? 0,
      paymentCustomerId: json['customerId'] ?? 0,
      paymentCustomerName: json['customerName'] ?? '',
    );
  }
}
