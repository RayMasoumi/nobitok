import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/constants/urls.dart';

class AuthService {
  Future<http.Response> auth(String username, String password) async {
    // * Implement auth API request to get the token here

    final url = Uri.parse('$kBaseUrl$kAuthUrl');
    final data = {
      "username": username,
      "password": password,
    };
    final headers = {
      'Content-Type': 'application/json',
    };

    final body = json.encode(data);

    try {
      final response = await http.post(
        url,
        body: body,
        headers: headers,
      );

      return response;
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }
}
