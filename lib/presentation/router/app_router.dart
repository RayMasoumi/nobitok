// // * creating a class for routing in between screens(similar to namedRouting):
//
// import 'package:flutter/material.dart';
//
// class AppRouter {
//   // * the function that takes the name of each screen and returns it:
//   Route? onGenerateRoute(RouteSettings routeSettings) {
//     // * we access each route by its name, which is provided by 'routeSettings.name'
//     switch (routeSettings.name) {
//       case '/':
//         return MaterialPageRoute(
//             builder: (_) => const);
//
//
//       default:
//         return null;
//     }
//   }
// }
