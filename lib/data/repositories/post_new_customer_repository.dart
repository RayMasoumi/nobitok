import 'dart:convert';

import '../../constants/strings.dart';
import '../models/customer.dart';
import '../services/post_new_customer_service.dart';

class PostNewCustomerRepository {
  final PostNewCustomerService postNewCustomerService;

  PostNewCustomerRepository(this.postNewCustomerService);

  Future<int> sendNewCustomer(Customer customer) async {
    final response = await postNewCustomerService.postNewCustomer(customer);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse['data']['personId']);
      print(jsonResponse['data']['documentNumber']);
      return jsonResponse['data']['personId'];
    } else {
      print('Send New Customer Status Code: ${response.statusCode}');
      print('Send New Customer Body: ${response.body}');
      throw Exception('$kSendNewCustomerException:${response.body}');
    }
  }
}
