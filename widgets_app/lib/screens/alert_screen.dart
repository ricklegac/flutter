import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);
  void IOSDisplayDialog(BuildContext context){
    showCupertinoDialog(
      barrierDismissible:false,
      
      context: context, 
      builder: (context){
        return CupertinoAlertDialog(
  
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
              onPressed: () {Navigator.pop(context);}, 
              child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
              
              ),
            TextButton(
              onPressed: () {Navigator.pop(context);}, 
              child: const Text('ok', style: TextStyle(color: Colors.indigo) ),
              )
          ],
        );
      }
      );
  }
  void AndroidDisplayDialog (BuildContext context){
    
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context){
        return  AlertDialog(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
              onPressed: () {Navigator.pop(context);}, 
              child: const Text('Cancelar'),
              
              ),
            TextButton(
              onPressed: () {Navigator.pop(context);}, 
              child:  const Text('ok'),
            ),
              
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
          onPressed: () =>  Platform.isIOS ? IOSDisplayDialog(context)
          : AndroidDisplayDialog(context),
          
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