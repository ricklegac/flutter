import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

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

  Widget _emptyCenter(){
    return const Center(
        child: Icon(
        Icons.movie_creation_outlined, 
        color: Colors.black, 
        size: 300,
        ),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) { //widget 
    if (query.isEmpty){
      return _emptyCenter();
    }
    final moviesProvider = Provider.of<MovieProvider>(context, listen: false);
    return FutureBuilder(
      future: moviesProvider.searchMovies(query), // es lo que necesito llamar cada vez que este widget se dispara 
      builder: (_, AsyncSnapshot<List<Result>> snapshot) {
        if(!snapshot.hasData){
          return _emptyCenter();
        }
        final movies = snapshot.data;
        return ListView.builder(
          itemCount: movies!.length,
          itemBuilder: (_, int index) => _MovieItem(movie: movies[index]),

        );
    },
    );
  }


}

class _MovieItem extends StatelessWidget {
  final Result movie;

  const _MovieItem({
    required this.movie,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: const AssetImage('assets/no-image.jpg'),
        image: NetworkImage(movie.fullPosterImg),
        width: 50 ,
        fit: BoxFit.contain,
      ),


    );
  }
}