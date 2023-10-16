import 'dart:async';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/helper/debouncer.dart';
import 'package:peliculas/models/now_playing_response.dart';
import 'dart:convert';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/search_response.dart';

class MovieProvider extends ChangeNotifier{ // para que sea un provider debe de extender de changenotifier
  final _apiKey = 'dce3b23572e77f35d099620c9feae51d';
  final _baseUrl = 'api.themoviedb.org';
  final _language = 'es-ES';
  List<Result> onDisplayMovies= [];
  List<Result> popularMovies =[];
  Map<int, List<Cast>>  moviesCast = {} ;
  int _popularpage =0 ;
  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
    //onValue:  //que yo quiero hacer cuando se dispare
  );
  final StreamController<List<Result>> _suggestionStreamController = new StreamController.broadcast(); // el stream controller en algun punto se debe de cerrar
  Stream<List<Result>> get suggestionStream => _suggestionStreamController.stream;
  MovieProvider(){
    
    getPopularMovies();
    getNowPlaying();
    
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
Future<String> _getJsonData_cast(String endPoint,[int page = 1]) async{ 
 
  var url = Uri.https(_baseUrl, endPoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
  });
  print('esta es la url $url');
  final response = await http.get(url);
  return response.body;
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
    Map<String, dynamic> jsonMap = await _fetchData('3/movie/popular',_popularpage );
    PopularResponse popularResponse = PopularResponse.fromJson(jsonMap);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  } catch (e) {
    print('Error fetching or parsing data: $e');
  }
}

  Future<List<Cast>> getMovieCast(int movieId) async {

    print(movieId);
    try{
      if( moviesCast.containsKey(movieId) ) return moviesCast[movieId]!;
      String jsonData = await _getJsonData_cast('3/movie/$movieId/credits');
      final creditsResponse = CreditsResponse.fromJson( jsonData );
      moviesCast[movieId] = creditsResponse.cast;
      return creditsResponse.cast;
    }catch (e){
      print('este error: $e');
      return [];
    }
    

  }

  Future<List<Result>> searchMovies (String query) async { // de alguna manera tiene que retornar un Stream
  //el stream es el que emite el valor 
    final url = Uri.https(_baseUrl, '3/search/movie', {
       'api_key': _apiKey,
      'language': _language,
      'query': query 
    },
    
    );

    final response = await http.get(url);
    final jsonString = response.body;
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    SearchResponse searchResponse = SearchResponse.fromJson(jsonMap);
    return searchResponse.results;

    
  }

  void getSuggestionByQuery(String searchTerm ){
    debouncer.value = '';
    debouncer.onValue =  (value )   async {
      //cuando el debouncer emita un valor
      print('tenemos un valor a buscar $value'); 

      final result = await this.searchMovies(value);
      this._suggestionStreamController.add(result);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), ( _ ) {
      // cada vez que pasa este tiempo hago:
      debouncer.value = searchTerm;

     });

     Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
  }
}
