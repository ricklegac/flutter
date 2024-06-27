import 'package:flutter/material.dart';
import 'package:productos_app/provider/product_form_provider.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:productos_app/ui/input_decoration.dart';
import 'package:provider/provider.dart';
class ProductsScreen extends StatelessWidget {
   
  
  const ProductsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context); 
    

    //return  _ProductScreenBody(productService: productService);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectedProduct), 
      child: _ProductScreenBody(productService: productService),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    super.key,
    required this.productService,
  });

  final ProductService productService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
         child: Column(children: [
          Stack(
            children: [
              ProductImage(url: productService.selectedProduct.picture), 
              
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
          const _productForm(),
          const SizedBox(height: 100,),
         ],)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save_alt_outlined, color: Colors.white,),
        onPressed: () {
    
        },
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
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
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
                initialValue: product.name,
                onChanged: ( value ) => {
                  product.name = value,
                },
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "El nombre es obligatorio";
                  }
                },
                decoration: InputDecorationHelper.authInputDecoration(
                  hintText: 'nombre del producto', 
                  labelText: 'nombre'
                 ),
              ),
              const SizedBox(height: 30,),
              TextFormField( 
                initialValue: '${product.price}',
                onChanged: (value){
                  if(double.tryParse(value) == null){
                    product.price = 0;

                  }else{
                    product.price = double.parse(value);
                  } 
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorationHelper.authInputDecoration(
                  hintText: 'precioo', 
                  labelText: 'precio'
                 ),
              ),
              const SizedBox(height: 30,),
              SwitchListTile(
                value: product.available, 
                title: const Text('Disponible'),
                onChanged: (value){
                //TODO: 
              }),
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