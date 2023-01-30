import 'package:flutter/material.dart';
import 'package:newsapp/home/view/details_page.dart';
import 'package:newsapp/home/view/main_home_page.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/splashpage/splashpage.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case "/splash":
      return MaterialPageRoute(builder: (context)=>const SplashPage());
      case "/main":
        return MaterialPageRoute(
          builder: (context) => const MainHomePage(),
        );
      case "/details":
        return MaterialPageRoute(
          builder: (context) => DetailsPage(data: args as Articles),
        );
    }
  }
}
