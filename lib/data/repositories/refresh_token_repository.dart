import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/strings.dart';
import '../services/refresh_token_service.dart';

class RefreshTokenRepository {
  final RefreshTokenService refreshTokenService;

  RefreshTokenRepository({required this.refreshTokenService});

  // * calling auth in auth service and storing the tokens
  Future<bool> refreshToken() async {
    final response = await refreshTokenService.refreshToken();
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      GetStorage().write(kTokenBox, jsonResponse['token']);
      GetStorage().write(kRefreshTokenBox, jsonResponse['refreshToken']);

      debugPrint('token refreshed success');

      return true;
    } else {
      throw Exception('$kRefreshTokenException:${response.statusCode}');
    }
  }
}
