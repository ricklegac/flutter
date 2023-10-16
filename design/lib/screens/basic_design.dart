import 'dart:ffi';

import 'package:flutter/material.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Column(
        children: [ 
          Image(image: AssetImage('lib/assets/landscape.webp')),
          Titulos(),
          Row(
            children: [
              Botones(icon: Icons.call, texto: 'call'),
              Botones(icon: Icons.route, texto: 'route'),
              Botones(icon: Icons.share, texto: 'share'),
            ]
          ),

        ]
      ),
    );
  }
}

class Botones extends StatelessWidget {
  final IconData icon;
  final String texto;
  const Botones({
    super.key,
    required this.icon,
    required this.texto
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Text('$texto'),
        SizedBox(width: 100,)
      ],

      
      

    );
  }
}
class Titulos extends StatelessWidget {
  const Titulos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child:  Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround , // de un row es horizontal de un column es vertical 
        children: [
          const Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Titulo cualquiera .. aaa bbb ..cc', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Subitulo cualquiera'),
          ],
            
          ),
          Expanded(
            child: Container()
          ),
          const Icon(Icons.star, color: Colors.red),
          const Text('41'),
    
        ],
    
      ),
    );
  }
}
