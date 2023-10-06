import 'package:flutter/material.dart';
//import 'package:peliculas/models/movie.dart';
class CastingCard extends StatelessWidget {
  //final List<Result> movies;
  const CastingCard({super.key, //required this.movies
  }
  );

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.infinity,
      height: 180,
     // color: Colors.green,
      margin: const  EdgeInsets.only(bottom: 30),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, int index) => _CastCard(),


        )

      

    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      width: 120,
      //color: Colors.red,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              image: NetworkImage('https://via.placeholder.com/150x300'),
              placeholder: AssetImage('assets/no-image.jpg'),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
              ),

          ),
          const SizedBox(height: 5,),
         Text('Aliquip esse consequat sit amet sint pariatur.', style: Theme.of(context).textTheme.caption,
         maxLines: 2,
         overflow: TextOverflow.ellipsis,
         )
        ],
        )
    );
  }
}