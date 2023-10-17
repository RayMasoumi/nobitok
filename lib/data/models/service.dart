import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final int serviceId;
  final String? serviceName;
  final double servicePrice;
  int serviceQuantity;

  Service(
      {required this.serviceId,
      this.serviceName,
      required this.servicePrice,
      this.serviceQuantity = 1});

  @override
  List<Object?> get props => [serviceId];
  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      serviceId: json['id'] ?? 0,
      servicePrice: json['price'] ?? 0.0,
      serviceName: json['name'] ?? '',
      serviceQuantity: json['qty'] ?? 1,
    );
  }
}
