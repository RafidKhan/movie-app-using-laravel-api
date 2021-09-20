
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/Pages/home_page.dart';
import 'package:splashscreen/splashscreen.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 14,
        navigateAfterSeconds: new HomePage(),
        title: new Text('Loading Data'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        loaderColor: Colors.red
    );
  }
}
