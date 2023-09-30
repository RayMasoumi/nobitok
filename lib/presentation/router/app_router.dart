// * creating a class for routing in between screens(similar to namedRouting):

import 'package:flutter/material.dart';
import 'package:nobitok/presentation/screens/home_screen.dart';
import 'package:nobitok/presentation/screens/login_screen.dart';

import '../../constants/strings.dart';

class AppRouter {
  // * the function that takes the name of each screen and returns it:
  Route? onGenerateRoute(RouteSettings routeSettings) {
    // * we access each route by its name, which is provided by 'routeSettings.name'
    switch (routeSettings.name) {
      case kLoginScreenRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case kHomeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return null;
    }
  }
}
