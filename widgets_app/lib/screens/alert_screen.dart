import 'package:flutter/material.dart';



class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);
  void DisplayDialog (BuildContext context){
    showDialog(
      context: context, 
      builder: (context){
        return const Text('aaaaa');
      }
      );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
         child: ElevatedButton(
          onPressed: () {

          }, 
          child: const Text('presionado'),
          )
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.close),
        
        )  ,
    );
  }
}