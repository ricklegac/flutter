    import 'package:flutter/material.dart';
    
    class ListViewBuilderScreen extends StatelessWidget {
       
      const ListViewBuilderScreen({Key? key}) : super(key: key);
      
      @override
      Widget build(BuildContext context) {
        return  Scaffold(
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index){
              return  FadeInImage(
              placeholder: const AssetImage('assets/jar-loading.gif'), 
              image: NetworkImage('https://picsum.photos/seed/picsum/200/300?image=$(index+1)'),
              );
            }
          ),
          // appBar:  AppBar(
          //   title:  const Text('List View Builder'),
          // ),
          
        );
      }
    }