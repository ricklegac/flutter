//
//import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:peliculas/models/movie.dart';

class MovieSlider extends StatelessWidget {
  final List<Result> movies;
  final String? titulo;

  const MovieSlider({
    super.key,
    required this.movies,
    this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      //color: Colors.black,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          if(titulo != null)
          Padding(
            
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(titulo!,style: const TextStyle(color: Colors.black, fontSize: 30)),
            
            
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder (
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: ( _ , int index){
                return  _MoviePoster( movie: movies[index]);
              },
              
              
            ),
          ),

  
      ]),
    );
  }
}
class _MoviePoster extends StatelessWidget { // aca recibimos la pelicula

  final Result movie;

  const _MoviePoster({
    
    required this.movie,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: 130,
                  height: 190,
                  //color: Colors.green,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'DetailScreen', arguments: 'movie-details'),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child:  FadeInImage(
                            placeholder:  const AssetImage('assets/no-image.jpg'), 
                            image: NetworkImage(movie.fullPosterImg),
                            width: 130,
                            height: 160,
                            fit: BoxFit.cover,
                            
                          ),
                        ),
                      ),
                      
                       Text(
                        movie.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center ,

                      )
                    ],
                  )

                );
  }
}