import 'package:get/get.dart';
import 'package:movie_app/Pages/detail_page.dart';
import 'package:movie_app/Pages/home_page.dart';

class AppRoutes {
  static String HOME = "/Home";
  static String DETAIL = "/Detail";

  static List<GetPage> routes = [
    GetPage(
      name: HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: HOME,
      page: () => DetailPage(),
    ),
  ];
}
