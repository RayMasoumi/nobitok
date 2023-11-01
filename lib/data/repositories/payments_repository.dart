import 'dart:convert';

import '../../constants/strings.dart';
import '../models/payment.dart';
import '../services/get_all_payments_service.dart';

class PaymentRepository {
  final GetAllPaymentsService getAllPaymentsService;

  PaymentRepository(this.getAllPaymentsService);

  Future<List<Payment>> fetchAllPayments() async {
    final response = await getAllPaymentsService.fetchAllPaymentsService();
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> dataList = jsonResponse['dataList'];
      List<Payment> payments = dataList.map((data) {
        return Payment.fromJson(data);
      }).toList();
      print(payments.length);
      return payments;
    } else {
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      throw Exception('$kGetAllPaymentsException:${response.body}');
    }
  }
}
