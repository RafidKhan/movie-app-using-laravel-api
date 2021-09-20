import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/Pages/home_page.dart';
import 'package:movie_app/Repository/appRoutes.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int internet;

  checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("Connectd to Data");
      splashFunction();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("Connected to wifi");
      splashFunction();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Check Your Internet Connection"),
        duration: Duration(milliseconds: 7000),
      ));

      setState(() {
        internet = 1;
      });
    }
  }

  splashFunction() async {
    await Future.delayed(Duration(milliseconds: 5000));
    Get.offNamed(AppRoutes.HOME);
  }

  @override
  void initState() {
    internet = 0;
    checkInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
            0.1,
            0.9,
          ], colors: [
            Color(0x5c0ceaea).withOpacity(.9),
            Color(0x5c0ceaea).withOpacity(.3)
          ]),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              children: [
                Container(
                    height: Get.height / 3,
                    width: Get.width,
                    child: Image.asset('assets/logo.png')),
                internet == 0
                    ? Text(
                  "Loading!",
                  style: TextStyle(fontSize: Get.width / 10),
                )
                    : Container(),
                SizedBox(
                  height: Get.height / 20,
                ),
                internet == 0 ? CircularProgressIndicator() : Container(),
                internet == 1
                    ? Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "No Internet Connection!",
                      style: TextStyle(
                          color: Colors.black, fontSize: Get.width / 15),
                    ),
                  ),
                )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
