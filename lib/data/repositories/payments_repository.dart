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
      print('something went wrong! Response Body: ${response.body}');
      throw Exception('$kGetAllPaymentsException:${response.body}');
    }
  }

  // * returns a list of [[payments],cashPaid, creditPaid]: >> payments = everything[0]
  Future<List<dynamic>> fetchPaymentsAndMoreByRange(
      String startDate, String endDate) async {
    final response =
        await getAllPaymentsService.fetchPaymentsByRange(startDate, endDate);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> dataList = jsonResponse['data']['pagedList'];
      // * list of payments:
      List<Payment> payments = dataList.map((data) {
        return Payment.fromJson(data);
      }).toList();
      // * cashPaid:
      final double? cashPaid = jsonResponse['data']['cashPaid'];
      print('this is what i fetched $cashPaid');
      // * creditPaid:
      final double? creditPaid = jsonResponse['data']['creditPaid'];
      print('this is what i fetched $creditPaid');
      // * a list of all data:
      List<dynamic> everything = [payments, cashPaid, creditPaid];
      return everything;
    } else {
      print('Response Status Code: ${response.statusCode}');
      print('something went wrong! Response Body: ${response.body}');
      throw Exception('$kFetchPaymentsByDateDataException:${response.body}');
    }
  }
}
