import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieSearchDelegate extends SearchDelegate{

  @override
  String get searchFieldLabel => Intl.message('Buscar Película', name: 'buscar_pelicula');

  @override
  List<Widget>? buildActions(BuildContext context) { //lista de widgets 
    return [ 
      IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => query='',
      )
    
    ];
   
  }

  @override
  Widget? buildLeading(BuildContext context) { // widget
    return IconButton(
      onPressed: () {
        close(context, null);
      }, 
      icon: const Icon(Icons.arrow_back),
      );
  }

  @override
  Widget buildResults(BuildContext context) { // widget 
    return  Text('buildResults $query');
    //throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) { //widget 
    if (query.isEmpty){
      return const Center(
        child: Icon(
        Icons.movie_creation_outlined, 
        color: Colors.black, 
        size: 300,
        ),
      );
    }
    return const Center();
  }

}