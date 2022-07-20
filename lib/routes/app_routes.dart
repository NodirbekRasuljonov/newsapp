
import 'package:flutter/material.dart';
import 'package:newsapp/screens/home/view/home_view.dart';

class AppRoutes{
  Route? onGenerateRoute(RouteSettings s){
    var args=s.arguments;
    switch (s.name) {
      case '/home':
        return MaterialPageRoute(builder: (context)=>HomeView(),);
    }
  }
}