import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/Pages/home_page.dart';
import 'package:movie_app/Repository/appRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Top Movie List",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.INITIAL,
    );
  }
}
