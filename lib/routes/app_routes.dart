import 'package:flutter/material.dart';
import 'package:newsapp/view/main_home_page.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case "/main":
        return MaterialPageRoute(
          builder: (context) => const MainHomePage(),
        );
    }
  }
}
