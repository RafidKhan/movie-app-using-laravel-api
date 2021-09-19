import 'dart:convert';
import 'package:movie_app/Models/movieModel.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  int count = 10;

  bool loader = false;

  Uri url = Uri.parse("https://salimdev.000webhostapp.com/api/movie");

  Future<List<MovieModel>> getMovieData() async {
    var response = await http.get(url);


    loader=true;

    return MovieModel.fromJsonList(json.decode(response.body));
  }


}
