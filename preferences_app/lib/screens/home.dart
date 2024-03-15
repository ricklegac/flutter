import 'package:flutter/material.dart';
import 'package:preferences_app/widgets.dart/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  static const String routerName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SideMenu(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Darkmode: '),
          Divider(),
          Text('Genero: '),
          Divider(),
          Text('Nombre de Usuario: '),
          Divider(),
        ],)
    );
  }
}