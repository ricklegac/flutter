import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  final options = const['LoL', 'Valorant','Final Fantasy'];  
  const Listview1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview1'),
      ),
      body: ListView(
        children: [ 
          ...options.map(
            (game) => ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(game),
            )
            
            ).toList(),
            
          //Text('widgets dentro de children'),
          // ListTile(
          //   leading: Icon(Icons.ac_unit),
          //   title: Text('list view 1'),

                    
          // ),
        ],
      ), 
    );
  }
}