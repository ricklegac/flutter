import 'package:flutter/material.dart';


class  HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 113, 154, 226)  ,
      appBar: AppBar(
        title: const Text('HomeScreen'),
        elevation: 2.0  , 
      ), 
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Text('numero de clicks'),
          Text('aaa'),
        ],
           
      ),
    );
  }

}