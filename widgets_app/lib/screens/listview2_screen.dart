import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  final options = const['LoL', 'Valorant','Final Fantasy'];  
  const Listview2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewList2'),
        elevation: 0, //sombra
        backgroundColor: Colors.indigo,
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) { return const Divider(); }, 
        itemBuilder: (BuildContext context, int index) { 
          return ListTile(
            title: Text(options[index]),
            trailing: const Icon(Icons.arrow_forward_ios_outlined, color:Colors.indigo),
            onTap: () {
              print('taped en ${options[index]}');
            },
          );
         }, 
        itemCount: options.length,

        
      ), 
    );
  }
}