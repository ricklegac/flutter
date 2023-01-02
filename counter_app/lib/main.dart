import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(App());

}

class App extends StatelessWidget{

  //todos los stalesswidgets contienen un override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home :  Center(child: Text ('Hola Mundo')),  //widget Text

    );
  
  }
   
}