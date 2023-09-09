import 'package:flutter/material.dart';
import 'package:nobitok/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: kLoginScreenBackgroundColor,
        ),
      ),
    );
  }
}
