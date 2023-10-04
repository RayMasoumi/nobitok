class Service {
  int serviceId;
  int? serviceName;
  double servicePrice;
  int? serviceQuantity;

  Service(
      {required this.serviceId,
      this.serviceName,
      required this.servicePrice,
      this.serviceQuantity = 1});
}
