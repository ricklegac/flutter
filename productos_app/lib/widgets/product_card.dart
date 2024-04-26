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
            _backgroundImage(),
            _productDetails()
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

class _productDetails extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      color: Colors.indigo,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text ('Cualquiera', 
        style: TextStyle(fontSize: 20, color:Colors.white), 
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        ),
      ],)
    );
  }
}

class _backgroundImage extends StatelessWidget {
  

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