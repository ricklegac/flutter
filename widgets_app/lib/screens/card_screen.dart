import 'package:flutter/material.dart';
import 'package:widgets_app/themes/app_theme.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text ('tarjetas'),
      ),
      body: ListView(
        padding:const  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children:  [
          Card(
            child:  Column(
              children: const [
                 ListTile(
                  leading: Icon(Icons.photo_album_sharp, color: AppTheme.primary),
                  title:  Text('titulo cualquiera'),
                  subtitle: Text('adasjkdasbdjaksdasd'),
                )
              ],
              )
          )
         ],
      ),
    );
  }
}