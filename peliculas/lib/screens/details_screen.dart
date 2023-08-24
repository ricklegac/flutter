import 'package:flutter/material.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return const Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: const Text('Peliculas'),
        
      // ),
      body:  CustomScrollView(
          slivers: [
            _AppBar()
          ],
        
      ),
      );
    
  }
}
class _AppBar extends StatelessWidget {
  const _AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar (
      backgroundColor: Colors.indigo,
      expandedHeight: 150,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Pelicula'),
        background: FadeInImage(placeholder: AssetImage('assets/loading.gif') , image: AssetImage('assets/loading.gif'),
        fit: BoxFit.cover),
        
      ),


    );
  }
}