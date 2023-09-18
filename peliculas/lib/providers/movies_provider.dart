import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/models/now_playing_response.dart';
import 'dart:convert';
class MovieProvider extends ChangeNotifier{ // para que sea un provider debe de extender de changenotifier
  final _apiKey = 'dce3b23572e77f35d099620c9feae51d';
  final _baseUrl = 'api.themoviedb.org';
  final _language = 'es-ES';
  List<Result> onDisplayMovies= [];
  MovieProvider(){
    print('movie provider inicializado');
    getNowPlaying();
    }
    Future<void> getNowPlaying() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    try {
      final response = await http.get(url);
      //final Map<String, dynamic> decodeData = json.decode(response.body);
      if (response.statusCode == 200) {
        // Successful response, process the data here
        //final data = response.body;
        String jsonString = response.body;
        Map<String, dynamic> jsonMap = json.decode(jsonString);
        NowPlayingResponse nowPlayingResponse = NowPlayingResponse.fromJson(jsonMap);
        print(nowPlayingResponse.results[0].title);
        onDisplayMovies = nowPlayingResponse.results; // cuando se ejecute tendra un lista de peliculas 
        print(onDisplayMovies);
        notifyListeners(); // va a notificar a los listeners 
       
      } else {
        // Handle HTTP error status codes
        print('HTTP Error: ${response.statusCode}');
        
      }
    } catch (e) {
      // Handle exceptions that may occur during the request
      print('Error: $e');
      
    }
    
  }
}



