import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';



class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('peliculas'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.search_outlined),
          )
        ],
      ),
      body: Column(
        children: const [
          CardSwipper(),
        ]
        //aca el listado horizontal de peliculas 
        

      ),
    );
  }
}