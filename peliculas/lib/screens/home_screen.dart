import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';




class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context,listen: true); // el listen es para redibujarse 
    //print(movieProvider.onDisplayMovies);
    return Scaffold(
      appBar: AppBar(
        title: const Text('peliculas'),
        elevation: 0,
        actions: [
          IconButton(
            
            icon: const Icon(Icons.search_outlined),
            onPressed: () => showSearch(
              context: context, 
              //el delegate es una clase o un widget  
              delegate: MovieSearchDelegate(),
              ), 
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwipper(movies: movieProvider.onDisplayMovies),
            MovieSlider (movies: movieProvider.popularMovies, titulo: 'Prueba Popular', 
              onNextPage: () => movieProvider.getPopularMovies()
        )
           
          ]
          //aca el listado horizontal de peliculas 
          
      
        ),
      ),
    );
  }
}