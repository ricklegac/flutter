import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: const Text('Peliculas'),
        
      // ),
      body:  CustomScrollView(
          slivers: [
            const _AppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  //const Text('Aaaa'),
                  _PosterAndTitle(),
                  _OverView(),
                  CastingCard(),
                ]
              ),
            )
            
          ],
      ),
      );
    
  }
}
class _AppBar extends StatelessWidget {
  const _AppBar({super.key});

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
          child: const Text('Pelicula',style: TextStyle(fontFamily: 'Roboto', fontSize: 16 )),
          
          ),
        background: const  FadeInImage(placeholder: AssetImage('assets/loading.gif') , image: NetworkImage('https://via.placeholder.com/500x300'),
        fit: BoxFit.cover),
        
      ),


    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme; 
    return Container(
      margin: const EdgeInsets.only(top:20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const  FadeInImage(
              height: 150,
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://via.placeholder.com/200x300'),
              ),
          ),
          const SizedBox(width: 10),

          Column(
            children:  [
               Text('movie.title',style: textTheme.headline5,
               overflow: TextOverflow.ellipsis, maxLines: 2),
               Text('movie.subtitle',style: textTheme.subtitle1,
               overflow: TextOverflow.ellipsis, maxLines: 1),
               
              Row(
                children: [
                  const Icon(Icons.star_border_outlined, size: 15, color: Colors.grey),
                  Text('movie.VoteAverage',style: textTheme.caption,),
                ],
              ),
            ],
          )
        ],
        
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text('Quis aliqua occaecat incididunt dolor culpa laborum in aliqua ut.Tempor in sint dolore esse nostrud laboris ea sunt officia aute esse sunt.Sint magna magna voluptate ut proident exercitation velit irure amet dolore veniam.',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}