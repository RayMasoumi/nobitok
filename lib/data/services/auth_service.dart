import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/constants/urls.dart';

import '../models/appointment.dart';

class AuthService {
  Future<List<Appointment>?> login(String username, String password) async {
    // * Your login API call to get a token
    final int authStatusCode = await _auth(username, password);

    if (authStatusCode == 200) {
      // * Fetch user information using the token
      return await fetchTodayAppointments();
    } else {
      throw Exception('$kAuthException:$authStatusCode');
    }
  }

  Future<int> _auth(String username, String password) async {
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
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        GetStorage().write(kTokenBox, jsonResponse['token']);
        GetStorage().write(kRefreshTokenBox, jsonResponse['refreshToken']);

        debugPrint('Login success in _auth in auth_service.dart');

        return response.statusCode;
      } else {
        debugPrint('$kAuthException:${response.statusCode}');
        return response.statusCode;
      }
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }

  Future<List<Appointment>> fetchTodayAppointments() async {
    // * Implement API request to fetch information using the token here
    final url = Uri.parse('$kBaseUrl$kGetAllTodayAppointmentsUrl');

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
        List<dynamic> dataList = jsonResponse['dataList'];
        List<Appointment> appointments = dataList.map((data) {
          return Appointment.fromJson(data);
        }).toList();
        return appointments;
      } else {
        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        throw Exception(
//! fetch_today_appointments_error
            '$kFetchTodayAppointmentsDataException:${response.body}');
      }
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }
}
