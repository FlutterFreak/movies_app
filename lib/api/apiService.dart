import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_search_app/model/model.dart';

const API_KEY = "b5439118";
const API_URL = "http://www.omdbapi.com/?apikey=";

Future<List<Movie>> searchMovies(keyword) async {
  final response = await http.get('$API_URL$API_KEY&s=$keyword&page=1');

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);
    print('response:$data');
    if (data['Response'] == "True") {
      var list = (data['Search'] as List)
          .map((item) => new Movie.fromJSON(item))
          .toList();
      print('list$list');
      return list;
    } else {
      return throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}

Future<bool> login(String name, String year) async {
  final response = await http.get('$API_URL$API_KEY&s=$name&y=$year');

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);

    if (data['Response'] == "True") {
      return true;
    } else {
      return false;
    }
  } else {
    throw Exception('Something went wrong !');
  }
}
