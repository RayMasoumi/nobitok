import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nobitok/data/services/auth_service.dart';

import '../../constants/strings.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  // * calling auth in auth service and storing the tokens
  Future<int> getToken(String username, String password) async {
    final response = await authService.auth(username, password);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      GetStorage().write(kTokenBox, jsonResponse['token']);
      GetStorage().write(kRefreshTokenBox, jsonResponse['refreshToken']);
      GetStorage().write(kUsernameBox, username);

      debugPrint('Login success in _auth in auth_service.dart');

      return response.statusCode;
    } else {
      debugPrint('$kAuthException:${response.statusCode}');
      return response.statusCode;
    }
  }
}
