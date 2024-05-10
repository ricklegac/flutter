import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/product_service.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productServices = Provider.of<ProductService>(context);
    if (productServices.isLoading) return const LoadingScreen();

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
        itemCount: productServices.products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: 
              ProductCard(
                product: productServices.products[index],
              ),
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