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
    print('buildsuggestion');
    if (query.isEmpty){
      return _emptyCenter();
    }

    final moviesProvider = Provider.of<MovieProvider>(context, listen: false);
    moviesProvider.getSuggestionByQuery(query); // esto se llama cada vez que se toca una tecla
    
      return StreamBuilder(
      stream: moviesProvider.suggestionStream, // desde el streambuilder que esta en movies_provider necesito llamar
      //se dispara cuando stream emite un valor!
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
    movie.heroId = 'search -${movie.id}';
    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage(movie.fullPosterImg),
          width: 200,
          fit: BoxFit.contain,
        ),
      ),
    title: Text(movie.title),
    // ignore: avoid_print
    onTap: () {
      Navigator.pushNamed(context, 'DetailScreen', arguments: movie);
    },

    );
  }
}