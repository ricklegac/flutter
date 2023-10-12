import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/widgets/widgets.dart';
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //este recibe del 
    final Result movie = (ModalRoute.of(context)!.settings.arguments) as Result;
    return Scaffold(
      body:  CustomScrollView(
          slivers: [
             _AppBar(movie: movie),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  _PosterAndTitle(movie: movie),
                  _OverView(movie: movie),
                  CastingCard(movieId: movie.id,),
                ]
              ),
            )
            
          ],
      ),
      );
    
  }
}
class _AppBar extends StatelessWidget {

  final Result movie;

   const _AppBar({
    super.key,
    required this.movie
  
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar (
      backgroundColor: Colors.indigo,
      expandedHeight: 150,
      floating: false,
      pinned: true,
      
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10,left: 10, right: 10),
          child:  
          Text(
            movie.title,
            style: const TextStyle(fontFamily: 'Roboto', fontSize: 16 ),
            textAlign: TextAlign.center,
            ),
          
          ),
        background:   FadeInImage
        (
          placeholder: const AssetImage('assets/loading.gif') , 
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover
        ),
        
      ),


    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  
  final Result movie;

  const _PosterAndTitle({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme; 
    return Container(
      margin: const EdgeInsets.only(top:20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:   FadeInImage(
              height: 150,
              placeholder:const  AssetImage('assets/no-image.jpg'), 
              image: NetworkImage(movie.fullPosterImg),
              ),
          ),
          const SizedBox(width: 10),

          ConstrainedBox(
            constraints: BoxConstraints (maxWidth: size.width - 200),
            child: Column(
              children:  [
                 Text(movie.title,style: textTheme.headline5,
                 overflow: TextOverflow.ellipsis, maxLines: 2),
                 Text(movie.originalTitle,style: textTheme.subtitle1,
                 overflow: TextOverflow.ellipsis, maxLines: 1),
                 
                Row(
                  children: [
                    const Icon(Icons.star_border_outlined, size: 15, color: Colors.grey),
                    Text(movie.voteAverage.toString(),style: textTheme.caption,),
                  ],
                ),
              ],
            ),
          )
        ],
      
      ),
    );
    
  }
}

class _OverView extends StatelessWidget {
  final Result movie;
  const _OverView({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(movie.overview,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}