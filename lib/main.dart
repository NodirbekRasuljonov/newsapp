import 'package:flutter/material.dart';
import 'package:newsapp/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: "/main",
    );
  }
}
