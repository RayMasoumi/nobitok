import 'dart:convert';

import 'package:nobitok/data/services/get_customer_details_service.dart';

import '../../constants/strings.dart';
import '../models/customer.dart';

class GetCustomerDetailsRepository {
  final GetCustomerDetailsService getCustomerDetailsService;

  GetCustomerDetailsRepository({required this.getCustomerDetailsService});

  Future<Customer> fetchCustomerDetails(int customerId) async {
    final response =
        await getCustomerDetailsService.fetchCustomerDetails(customerId);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      final customer = Customer(
          customerId: jsonResponse['data']['id'],
          customerName: jsonResponse['data']['name'],
          customerPhoneNumber: jsonResponse['data']['phoneNumber'],
          customerDateOfBirth: jsonResponse['data']['dateOfBirth'],
          customerDocumentCode: jsonResponse['data']['documentNumber'],
          customerIdCode: jsonResponse['data']['nationalCode'],
          customerAppointments: [],
          customerInvoices: []);
      return customer;
    } else {
      // ! 'get_customer_detail_error'
      throw Exception('$kGetCustomerDetailException:${response.statusCode}');
    }
  }
}
