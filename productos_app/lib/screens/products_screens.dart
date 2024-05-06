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
                  icon: const Icon(Icons.camera_alt_outlined, size: 40, color: Colors.black)),
              ),
               
            ],

          ),
          _productForm(),
          const SizedBox(height: 100,),
         ],)
      ),
    );
  }
}

class _productForm extends StatelessWidget {
  const _productForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const  EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        
        
        
        decoration: _boxDecoration(),
        child: Form(
            child: Column(children: [
              const SizedBox(height: 10,),
              TextFormField(

              ),
              const SizedBox(height: 30,),
            ],),
          ),
    )
    );
  }

  BoxDecoration _boxDecoration() {
    return const  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0,5),
            blurRadius: 5,
          )
        ]
    );
  }
}