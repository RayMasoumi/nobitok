class Service {
  int serviceId;
  String? serviceName;
  double servicePrice;
  int serviceQuantity;

  Service(
      {required this.serviceId,
      this.serviceName,
      required this.servicePrice,
      this.serviceQuantity = 1});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      serviceId: json['id'] ?? 0,
      servicePrice: json['price'] ?? 0.0,
      serviceName: json['name'] ?? '',
      serviceQuantity: json['qty'] ?? 1,
    );
  }
}
