import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) { //lista de widgets 
    return [ 
      const Text('buildActions')
    
    ];
   
  }

  @override
  Widget? buildLeading(BuildContext context) { // widget
    return const Text('buildLeading');
    //throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) { // widget 
    return const Text('buildResults');
    //throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) { //widget 
    return const Text('buildSuggestions');
   // throw UnimplementedError();
  }

}