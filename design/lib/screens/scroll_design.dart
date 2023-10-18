import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
   
  const ScrollScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Fondo(),
        TextoMedio(),
      ],
    );
      
    
  }
}

class TextoMedio extends StatelessWidget {
  const TextoMedio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          Text('hoalq ue t')
        ],
      ),
    );
  }
}

class Fondo extends StatelessWidget {
  const Fondo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(79, 194, 221, 1.0 ),
      alignment: Alignment.topCenter,
      child: const Image( image: AssetImage('lib/assets/scroll-1.png'),),
    );
  }
}