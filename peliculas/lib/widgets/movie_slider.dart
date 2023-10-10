

import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';

class MovieSlider extends StatefulWidget {
  final List<Result> movies;
  final String? titulo;
  final Function onNextPage;
  const MovieSlider({
    super.key,
    required this.movies,
    this.titulo, 
    required this.onNextPage,
  });

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController contro_scroll = new ScrollController(); 
 @override
void initState() {
 super.initState();
 // Variable que almacenara el valor de maxScrollExtent al momento de llamar onNextPage()
 double? maxScrollTemp;
 contro_scroll.addListener(() {
   double positionScroll = contro_scroll.position.pixels;
   double maxScroll = contro_scroll.position.maxScrollExtent;
   if (positionScroll >= maxScroll - 600) {
     // Si maxScrollTemp es null, es porque no se ha llamado a onNextPage()
     // Por otro lado sera cierto si maxScrollTemp es igual a maxScroll
     if (maxScrollTemp == maxScroll) {
       return;
     } else {
       widget.onNextPage();
       // Almacenamos el valor de maxScroll en el momento de llamar a onNextPage()
       maxScrollTemp = maxScroll;
     }
   }
 });
}
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      //color: Colors.black,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          if(widget.titulo != null)
          Padding(
            
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(widget.titulo!,style: const TextStyle(color: Colors.black, fontSize: 30)),
            
            
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder ( // este es el que construye el slider 
              controller: contro_scroll,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: ( _ , int index){
                return  _MoviePoster( movie: widget.movies[index]);
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
                        onTap: () => Navigator.pushNamed(context, 'DetailScreen', arguments: movie),
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