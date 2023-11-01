import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:nobitok/methods/calculate_date_method.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../constants/strings.dart';
import '../../constants/urls.dart';

class PostEndOfDayService {
  Future<http.Response> postEndOfDay(
    String cash,
    String credit,
  ) async {
// * Implement API request to send information using the token here
    final url = Uri.parse('$kBaseUrl$kPostEndOfDayUrl');

    final headers = {
      'Authorization': 'Bearer ${GetStorage().read(kTokenBox)}',
      'Content-Type': 'application/json',
    };

    final body = {
      "startDate": formatDateJalali(Jalali.now()),
      "endDate": formatDateJalali(Jalali.now()),
      "actualCredit": credit,
      "actualCash": cash,
    };
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
