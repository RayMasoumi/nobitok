import 'dart:convert';

import '../../constants/strings.dart';
import '../models/customer.dart';
import '../services/get_all_customers_service.dart';

class CustomerRepository {
  final GetAllCustomersService getAllCustomersService;

  CustomerRepository(this.getAllCustomersService);

  Future<List<Customer>> fetchAllCustomers() async {
    final response = await getAllCustomersService.getAllCustomers();
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> dataList = jsonResponse['dataList'];
      List<Customer> customers = dataList.map((data) {
        return Customer.fromJson(data);
      }).toList();
      return customers;
    } else {
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      throw Exception('$kGetAllCustomersException:${response.body}');
    }
  }
}
