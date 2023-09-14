import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class MovieProvider extends ChangeNotifier{ // para que sea un provider debe de extender de changenotifier
  String _apiKey = 'dce3b23572e77f35d099620c9feae51d';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';
  MovieProvider(){
    print('movie provider inicializado');
    this.getNowPlaying();
    }
    Future<void> getNowPlaying() async {
    var url = Uri.https(this._baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    try {
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        // Successful response, process the data here
        final data = response.body;
        print(data);
       
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



