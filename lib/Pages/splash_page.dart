import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/Repository/apiCall.dart';
import 'package:movie_app/Repository/appRoutes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final apiCall = Get.put(ApiCall());

  goToHome() async{
    await apiCall.getMovieData();
    //Get.toNamed(AppRoutes.HOME);
  }

  @override
  void initState() {
    goToHome();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    print("SPLAAAAAAAAAAAAAAASHHHHHHHHHHHHHHHHHHHHHHHH");
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
