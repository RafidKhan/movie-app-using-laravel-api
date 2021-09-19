import 'dart:convert';
import 'package:get/get.dart';
import 'package:movie_app/Models/movieModel.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Pages/home_page.dart';

class ApiCall {
  final homePage = Get.put(HomePage());

  List title;

  int count = 10;

  bool loader = false;

  Uri url = Uri.parse("https://salimdev.000webhostapp.com/api/movie");

  Future<List<MovieModel>> getMovieData() async {
    var response = await http.get(url);

    print(response.statusCode);
    return MovieModel.fromJsonList(json.decode(response.body));
  }
}
