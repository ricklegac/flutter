import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCard extends StatelessWidget {
  final int movieId;
  const CastingCard({
    super.key,
    required this.movieId, 
  }
  );

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MovieProvider>(context,listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if(!snapshot.hasData){
          return Container(
            constraints: const BoxConstraints(maxWidth: 150),
            height: 180,
            child: const CupertinoActivityIndicator(),
          );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          width: double.infinity,
          height: 180,
          margin: const  EdgeInsets.only(bottom: 30),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            itemBuilder: (_, int index) => _CastCard(actor: cast[index]),
          )
        );
      },
    );
    
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;
  const _CastCard({
    required this.actor,
    super.key
    });

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
            child:  FadeInImage(
              image: NetworkImage(actor.fullProfilePath),
              placeholder: const AssetImage('assets/no-image.jpg'),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
              ),

          ),
        const SizedBox(height: 5,),
          Text(actor.name, style: Theme.of(context).textTheme.caption,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        )
        ],
        )
    );
  }
}