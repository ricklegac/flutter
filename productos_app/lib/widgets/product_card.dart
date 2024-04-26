import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  
  const ProductCard({super.key});

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
            _BackgroundImage(),
            _ProductDetails(),
            const Positioned (
              top: 0,
              right: 0,
              child: _PriceTag()),
            const Positioned (
              top: 0,
              left: 0,
              child: _Unvailable(),)
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
  const _Unvailable({
    super.key,
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
      child: const FittedBox(
        fit:BoxFit.contain,
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('no disponible', style: TextStyle(color: Colors.white),)
        )
      )
    );
    
  }
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({
    super.key,
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
         const FittedBox (
            fit: BoxFit.contain,
           child:   Padding(
              padding: EdgeInsets.symmetric(horizontal: .1, vertical: .1),
              child:  Text('\$100', style: TextStyle(color: Colors.white, fontSize: 20))),
         ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  

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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text ('Cualquiera', 
          style: TextStyle(fontSize: 20, color:Colors.white), 
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          ),
          Text ('Id del Cualquiera', 
          style: TextStyle(fontSize: 15, color:Colors.white), 
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
  

  @override
  Widget build(BuildContext context) {
    return ClipRRect( 
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity, 
        height: 400,
        color: Colors.red,
        child: const  FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
         ),
          
      ),
    );
  }
}