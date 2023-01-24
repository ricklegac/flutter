import 'package:counter_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const App());

}

class App extends StatelessWidget{
  const App({super.key}); //constructor de la clase 


  //todos los stalesswidgets contienen un override
  @override
  Widget build(BuildContext context) {
    return const MaterialApp( //MaterialApp es un widget
      debugShowCheckedModeBanner: false,
      home: HomeScreen() //widget Text

    );
  
  }
   
}