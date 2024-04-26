import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductsScreen extends StatelessWidget {
   
  const ProductsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
         child: Column(children: [
          Stack(
            children: [
              ProductImage(),  
            ],
          )
         ],)
      ),
    );
  }
}