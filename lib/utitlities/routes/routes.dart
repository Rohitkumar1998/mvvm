import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/utitlities/routes/rotuteName.dart';
import 'package:mvvm/view/homeScreen.dart';
import 'package:mvvm/view/logScreen.dart';

class Routes {
  static MaterialPageRoute genrateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());

      case RoutesNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LogScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No rotes defined'),
            ),
          );
        });
    }
  }
}