import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(App());

}

class App extends StatelessWidget{

  //todos los stalesswidgets contienen un override
  @override
  Widget build(BuildContext context) {
    return const MaterialApp( //MaterialApp es un widget
      home : Center( //Center es un Widget

        child:  Text ('Hola Mundo') // Text es un Widget
        
        ),  //widget Text

    );
  
  }
   
}