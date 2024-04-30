import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductsScreen extends StatelessWidget {
   
  const ProductsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
         child: Column(children: [
          Stack(
            children: [
              const ProductImage(), 
              
              Positioned(
                top: 45,
                left: 25,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios, size: 40, color: Colors.black)),
              ),
              Positioned(
                top: 45,
                right: 25,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.build_outlined, size: 40, color: Colors.black)),
              ),
               
            ],
          )
         ],)
      ),
    );
  }
}