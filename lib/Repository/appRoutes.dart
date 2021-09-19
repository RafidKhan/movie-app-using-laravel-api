import 'package:get/get.dart';
import 'package:movie_app/Pages/detail_page.dart';
import 'package:movie_app/Pages/home_page.dart';

class AppRoutes {
  static String INITIAL = "/";
  static String HOME = "/login";
  static String DETAIL = "/signup";

  static List<GetPage> routes = [
    GetPage(
      name: INITIAL,
      page: () => HomePage(),
    ),
    GetPage(
      name: HOME,
      page: () => DetailPage(),
    ),
  ];
}
