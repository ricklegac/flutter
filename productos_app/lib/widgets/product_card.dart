import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';


class ProductCard extends StatelessWidget {
  
  final Products product; 
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
      child: Container(
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        height: 400,
        decoration: _cardBorder(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(url: product.picture),
            _ProductDetails(nombre_producto: product.name,id_producto: product.id,),
           Positioned (
              top: 0,
              right: 0,
              child: _PriceTag(precio: product.price)),
           Positioned (
              top: 0,
              left: 0,
              child: _Unvailable(isAvailable: product.available,),)
          ],
          
        )
        
      ),
    );
  }

  BoxDecoration _cardBorder() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25 ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0,5),
            blurRadius: 10,
          )
        ]
      );
  }
}

class _Unvailable extends StatelessWidget {
  final bool isAvailable;
  const _Unvailable({
    super.key, required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      decoration: const BoxDecoration(
        color:Colors.amber,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10))
      ),
      child: FittedBox(
        fit:BoxFit.contain,
        alignment: Alignment.center,
        child: Padding(
          padding: const  EdgeInsets.symmetric(horizontal: 10),
          child: Text(isAvailable ? 'disponible' : 'no disponible', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),)
        )
      )
    );
    
  }
}

class _PriceTag extends StatelessWidget {
  final double precio;
  const _PriceTag({
    super.key, required this.precio,
  });

  @override
  Widget build(BuildContext context) {
    return  Container( 
      alignment: Alignment.center,
      width: 100,
      height: 30,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomLeft: Radius.circular(25))
      ),
      
      child: 
          FittedBox (
            fit: BoxFit.contain,
           child:   Padding(
              padding:const EdgeInsets.symmetric(horizontal: .1, vertical: .1),
              child:  Text(precio.toString() , style: TextStyle(color: Colors.white, fontSize: 20))),
         ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final String nombre_producto;
  final String? id_producto;

  const _ProductDetails({
    super.key, 
    required this.nombre_producto, 
    this.id_producto
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const  EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        width: double.infinity,
        height: 70,
        //color: Colors.indigo,
        decoration: _decorationProduct(),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text (nombre_producto, 
          style: const TextStyle(fontSize: 20, color:Colors.white), 
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          ),
          Text (id_producto ?? '', 
          style: const TextStyle(fontSize: 15, color:Colors.white), 
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          ),
        ],)
      ),
    );
  }

  BoxDecoration _decorationProduct() => const BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25) , topRight: Radius.circular(25)),

  );
}

class _BackgroundImage extends StatelessWidget {
  
  final String? url;

  const _BackgroundImage({super.key,  this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect( 
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity, 
        height: 400,
        color: Colors.red,
        child:  FadeInImage(
          placeholder: const AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(url ?? ''),
          fit: BoxFit.cover,
         ),
          
      ),
    );
  }
}