import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/home/cubit/home_cubit.dart';
import 'package:newsapp/routes/app_routes.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'NewsApp',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: "/splash",
        );
      },
    );
  }
}
