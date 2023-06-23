import 'package:flutter/material.dart';



class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);
  void DisplayDialog (BuildContext context){
    
    showDialog(
      barrierDismissible: true,
      context: context, 
      builder: (context){
        return  AlertDialog(
          elevation: 5,
          title: const Text('Title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const[
              Text('logo flutter'),
              SizedBox(height: 10,),
              FlutterLogo(size:100),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {}, 
              child: const Text('hola'),
              )
          ],
        );
      }
      );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
         child: ElevatedButton(
          onPressed: () {
            DisplayDialog(context);
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