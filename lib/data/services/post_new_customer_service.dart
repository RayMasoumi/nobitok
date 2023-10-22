import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../constants/strings.dart';
import '../../constants/urls.dart';
import '../models/customer.dart';

class PostNewCustomerService {
  Future<http.Response> postNewCustomer(Customer customer) async {
// * Implement API request to send information using the token here
    final url = Uri.parse('$kBaseUrl$kPostNewCustomerUrl');
    final headers = {
      'Authorization': 'Bearer ${GetStorage().read(kTokenBox)}',
      'Content-Type': 'application/json',
    };

    final Map<String, String?> body;
    if (customer.customerIdCode!.isEmpty) {
      body = {
        "name": customer.customerName,
        "phone": customer.customerPhoneNumber,
        "dateOfBirth": customer.customerDateOfBirth.toEnglishDigit(),
        "description": customer.customerDescription,
      };
    } else {
      body = {
        "name": customer.customerName,
        "phone": customer.customerPhoneNumber,
        "nationalCode": customer.customerIdCode,
        "dateOfBirth": customer.customerDateOfBirth.toEnglishDigit(),
        "description": customer.customerDescription,
      };
    }

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );
      return response;
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }
}
