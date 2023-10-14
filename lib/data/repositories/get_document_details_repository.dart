import 'dart:convert';

import 'package:nobitok/data/services/get_document_details_service.dart';

import '../../constants/strings.dart';
import '../models/invoice.dart';

class GetDocumentDetailsRepository {
  final GetDocumentDetailsService getDocumentDetailsService;

  GetDocumentDetailsRepository({required this.getDocumentDetailsService});

  Future<List<Invoice>> fetchDocumentDetails(int customerId) async {
    final response =
        await getDocumentDetailsService.fetchDocumentDetails(customerId);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      List<Invoice> dataList = [];
      if (jsonResponse['dataList'] != null) {
        dataList = List<Invoice>.from(
            jsonResponse['dataList'].map((item) => Invoice.fromJson(item)));
      }
      // final customer = Customer(
      //     customerId: jsonResponse['data']['id'],
      //     customerName: jsonResponse['data']['name'],
      //     customerPhoneNumber: jsonResponse['data']['phoneNumber'],
      //     customerDateOfBirth: jsonResponse['data']['dateOfBirth'],
      //     customerDocumentCode: jsonResponse['data']['documentNumber'],
      //     customerIdCode: jsonResponse['data']['nationalCode'],
      //     customerAppointments: [],
      //     customerInvoices: []);
      return dataList;
    } else if (response.statusCode == 207) {
      return [];
    } else {
      // ! 'get_customer_detail_error'
      throw Exception('$kGetCustomerDetailException:${response.statusCode}');
    }
  }
}
