// * creating a class for routing in between screens(similar to namedRouting):

import 'package:flutter/material.dart';
import 'package:nobitok/presentation/screens/add_appointment_screen.dart';
import 'package:nobitok/presentation/screens/box_screen.dart';
import 'package:nobitok/presentation/screens/completed_appointments_screen.dart';
import 'package:nobitok/presentation/screens/create_new_document_screen.dart';
import 'package:nobitok/presentation/screens/home_screen.dart';
import 'package:nobitok/presentation/screens/login_screen.dart';
import 'package:nobitok/presentation/screens/search_result_screen.dart';

import '../../constants/strings.dart';

class AppRouter {
  // * the function that takes the name of each screen and returns it:
  Route? onGenerateRoute(RouteSettings routeSettings) {
    // * we access each route by its name, which is provided by 'routeSettings.name'
    switch (routeSettings.name) {
      case kLoginScreenRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case kHomeScreenRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case kAddAppointmentScreenRoute:
        return MaterialPageRoute(builder: (_) => const AddAppointmentScreen());
      case kCreateNewDocumentScreenRoute:
        return MaterialPageRoute(
            builder: (_) => const CreateNewDocumentScreen());
      case kCompletedAppointmentsScreenRoute:
        return MaterialPageRoute(
            builder: (_) => const CompletedAppointmentsScreen());
      case kSearchResultScreenRoute:
        return MaterialPageRoute(builder: (_) => const SearchResultScreen());
      case kBoxScreenRoute:
        return MaterialPageRoute(builder: (_) => const BoxScreen());
      default:
        return null;
    }
  }
}
