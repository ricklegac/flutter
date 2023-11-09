import 'package:flutter/material.dart';

class MapasPage extends StatelessWidget {
   
  const MapasPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, int index) => ListTile(
        leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
        title: const Text('cualquoer cosa'),
        subtitle: const Text('id'),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
        onTap: () {
          print("abriendo");
        },
        ),
        //title: Text('http'),
      );
    
  }
}