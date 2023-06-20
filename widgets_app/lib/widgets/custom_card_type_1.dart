import 'package:widgets_app/screens/screens.dart';
import 'package:flutter/material.dart';

import '../themes/app_theme.dart';
class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child:  Column(
        children:  [
           const ListTile(
            leading: Icon(Icons.photo_album_sharp, color: AppTheme.primary),
            title:  Text('titulo cualquiera'),
            subtitle: Text('adasjkdasbdjaksdasd'),
          ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          
          child: Row( //row no puede ser constante porque se actualiza segun la pantalla y demas
            mainAxisAlignment: MainAxisAlignment.end, 
            children: [
              TextButton(
                onPressed:() {}, 
                child: const Text('cancel'),
                style: TextButton.styleFrom(primary: Colors.red),
              ),
              TextButton(
                onPressed: () {}, 
                child: const Text('ok'),
              )
            ],
          ),
        )
        ],
        
        )
    );
  }
}