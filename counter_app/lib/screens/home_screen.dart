import 'package:flutter/material.dart';


class  HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    const fontsize30 = TextStyle(fontSize: 30);
        // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 113, 154, 226)  ,
      appBar: AppBar(
        title: const Text('HomeScreen'),
        elevation: 2.0  , 
      ), 
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Text('numero de clicks',style: TextStyle(fontSize: 20) ),
          Text('aaa', style: fontsize30,),
        ],
           
      ),
      
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.plus_one_rounded),
      onPressed: () {
       // print('click');

      } ,
    ),
    );
  }

}