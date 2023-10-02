import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:nobitok/data/models/appointment.dart';
import 'package:nobitok/data/models/invoice.dart';

import '../../constants/strings.dart';
import '../../constants/urls.dart';
import '../models/appointment_detail.dart';
import '../models/customer.dart';
import '../models/invoice_item.dart';

class GetDetailsService {
  Future<AppointmentDetail?> getAppointmentDetail(
      int customerId, int invoiceId, Appointment appointmentDetail) async {
    final Customer customerDetail;
    try {
      customerDetail = await _getCustomerDetails(customerId);
      final Invoice invoiceDetail;
      try {
        invoiceDetail = await _getInvoiceDetails(invoiceId);

        return AppointmentDetail(
            invoiceDetail: invoiceDetail,
            customerDetail: customerDetail,
            appointmentDetail: appointmentDetail);
      } catch (e) {
        // ! 'get_invoice_detail_error'
        throw Exception(
            '$kGetInvoiceDetailException:$e:in getAppointmentDetail');
      }
    } catch (e) {
      // ! 'get_customer_detail_error'
      throw Exception(
          '$kGetCustomerDetailException:$e:in getAppointmentDetail');
    }
  }

  Future<Customer> _getCustomerDetails(int customerId) async {
    final url = Uri.parse('$kBaseUrl$kGetCustomerDetailUrl/$customerId');
    print(url);
    final headers = {
      'Authorization': 'Bearer ${GetStorage().read(kTokenBox)}',
      'Content-Type': 'application/json',
    };
    try {
      final response = await http.get(
        url,
        headers: headers,
      );

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
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }

  Future<Invoice> _getInvoiceDetails(int invoiceId) async {
    final url = Uri.parse('$kBaseUrl$kGetInvoiceDetailUrl?Id=$invoiceId');

    final headers = {
      'Authorization': 'Bearer ${GetStorage().read(kTokenBox)}',
      'Content-Type': 'application/json',
    };
    try {
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        final factorItems = jsonResponse['data']['factorItems'];
        final invoiceItems = (factorItems as List<dynamic>)
            .map((item) => InvoiceItem.fromJson(item))
            .toList();
        final invoice = Invoice(
            invoiceId: jsonResponse['data']['id'],
            invoiceDate: jsonResponse['data']['date'],
            isPaid: jsonResponse['data']['isPaid'],
            customerId: jsonResponse['data']['customerId'],
            appointmentId: jsonResponse['data']['appointmentId'],
            invoiceTotal: jsonResponse['data']['total'],
            invoiceItems: invoiceItems);
        return invoice;
      } else {
        // ! 'get_invoice_detail_error'
        throw Exception('$kGetInvoiceDetailException:${response.statusCode}');
      }
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }
}
