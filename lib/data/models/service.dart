import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final int serviceId;
  final String? serviceName;
  final double servicePrice;
  int serviceQuantity;
  final int priceType;
  final double? maxPrice;
  final double? minPrice;

  Service({
    required this.serviceId,
    this.serviceName,
    required this.servicePrice,
    required this.serviceQuantity,
    this.priceType = 0,
    this.maxPrice,
    this.minPrice,
  });

  @override
  List<Object?> get props => [serviceId];
  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      serviceId: json['id'] ?? 0,
      servicePrice: json['price'] ?? 0.0,
      serviceName: json['name'],
      serviceQuantity: json['qty'] ?? 0,
      priceType: json['priceType'] ?? 0,
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice'],
    );
  }
}
