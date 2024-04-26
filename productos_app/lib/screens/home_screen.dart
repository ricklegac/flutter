import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Productos', 
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: 
              ProductCard(),
              onTap: () => Navigator.pushNamed( context , 'productscreen')
            );
        },
      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        ),
      
      );
  }
}