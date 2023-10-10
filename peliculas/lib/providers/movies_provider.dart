import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/models/now_playing_response.dart';
import 'dart:convert';

import 'package:peliculas/models/popular_response.dart';
//import 'package:peliculas/models/models.dart';

//import 'package:peliculas/models/popular_response.dart';
class MovieProvider extends ChangeNotifier{ // para que sea un provider debe de extender de changenotifier
  final _apiKey = 'dce3b23572e77f35d099620c9feae51d';
  final _baseUrl = 'api.themoviedb.org';
  final _language = 'es-ES';
  List<Result> onDisplayMovies= [];
  List<Result> popularMovies =[];
  int _popularpage =0 ;
  MovieProvider(){
    //print('movie provider inicializado');
    getPopularMovies();
    getNowPlaying();
    }

  Future<String> _getJsonData(String endpoint, [int page = 1] ) async 
  { 
  // se pone entre llaves [int page = 1] cuando es opcional
  // si no viene nada entonces toma como 1 el page 
    var url = Uri.https(
      _baseUrl, endpoint,
      {
        'api_key': _apiKey,
        'language': _language,
        'page':'$page'
      }
    );
    final response = await http.get(url);
    String jsonString = response.body;
    return jsonString;
  }


  Future<Map<String, dynamic>> _fetchData(String endpoint,[page = 1]) async {
  var url = Uri.https(
    _baseUrl,
    endpoint,
    {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page', // You can modify this as needed
    },
  );
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch data from $endpoint');
  }
}

Future<void> getNowPlaying() async {
  try {
    Map<String, dynamic> jsonMap = await _fetchData('3/movie/now_playing');
    NowPlayingResponse playingResponse = NowPlayingResponse.fromJson(jsonMap);
    onDisplayMovies = playingResponse.results;
    notifyListeners();
  } catch (e) {
    print('Error fetching or parsing data: $e');
  }
}

Future<void> getPopularMovies() async {
  try {
    _popularpage++;
    Map<String, dynamic> jsonMap = await _fetchData('3/movie/popular',_popularpage);
    PopularResponse popularResponse = PopularResponse.fromJson(jsonMap);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  } catch (e) {
    print('Error fetching or parsing data: $e');
  }
}



}
