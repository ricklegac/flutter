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


  getPopularMovies() async // async porque necesita peticiones http
  { 
     var url = Uri.https(
      _baseUrl, '3/movie/popular',
      {'api_key': _apiKey,
       'language': _language, 
       'page': '1'
      });
      final response = await http.get(url);
      //final pR = PopularResponse.fromJson(response.body);
      String jsonString = response.body;
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      PopularResponse popularResponse = PopularResponse.fromJson(jsonMap);
      popularMovies = [...popularMovies ,...popularResponse.results]; // ... desestructurar
      // desestructurar porque se cambia de pagina 
      notifyListeners(); 
  }

  Future<void> getNowPlaying() async 
  {

    var url = Uri.https(
      _baseUrl, '3/movie/now_playing',
      {
        'api_key': _apiKey,
        'language': _language,
        'page':'1'
      }
    );
    final response = await http.get(url);
    String jsonString = response.body;
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    NowPlayingResponse playingResponse = NowPlayingResponse.fromJson(jsonMap);
    onDisplayMovies = playingResponse.results;
    notifyListeners();

   
    
  }
}




