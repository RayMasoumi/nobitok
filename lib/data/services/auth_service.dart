import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/constants/urls.dart';

import '../models/user.dart';

class AuthService {
  Future<User?> login(String username, String password) async {
    // * Your login API call to get a token
    final int authStatusCode = await _auth(username, password);

    if (authStatusCode == 200) {
      print('yaaaaaaaaaaaaaaay');
      // * Fetch user information using the token
      // final user = await _fetchUserInformation();
    } else {
      print('noooooooooooooooooo');
    }
    return User(
        userId: 0,
        username: 'username',
        userEmail: 'userEmail',
        userPhoneNumber: 'userPhoneNumber',
        appointments: [],
        preAppointments: []);
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

    final response = await http.post(
      url,
      body: body,
      headers: headers,
    );

    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        GetStorage().write(kTokenBox, jsonResponse['token']);
        GetStorage().write(kRefreshTokenBox, jsonResponse['refreshToken']);
        debugPrint('Login success in _auth in auth_service.dart');

        return response.statusCode;
      } else {
        debugPrint(
            'Login failed in _auth in auth_service.dart \n status code: ${response.statusCode} \n body: ${response.body}');
        return response.statusCode;
      }
    } catch (error) {
      throw Exception('Failed to connect to the server: $error');
    }
  }

  Future<User> _fetchUserInformation() async {
    // * Implement API request to fetch user information using the token here
    // todo fix this function
    final url = Uri.parse('$kBaseUrl');

    final Map<String, dynamic> data = {};

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = json.encode(data);

    final response = await http.post(url, body: body, headers: headers);

    try {
      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        print('success to fetch user information');
        return User.fromJson(userData);
      } else {
        throw Exception('Failed to fetch user information');
      }
    } catch (error) {
      throw Exception('Failed to connect to the server: $error');
    }
  }
}
