

import 'package:flutter/material.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const  Scaffold(
      body: Column(
        
        children: [ 
           Image(image: AssetImage('lib/assets/landscape.webp')),
          
           Titulos(),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Botones(icon: Icons.call, texto: 'call', colores: Colors.red,),
              Botones(icon: Icons.route, texto: 'route',colores: Colors.green),
              Botones(icon: Icons.share, texto: 'share', colores: Colors.blue),
            ]
          ),
          Texto(),
          

        ],
      ),
    );
  }
}

class Texto extends StatelessWidget {
  const Texto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: const Text('Consectetur ipsum do consequat adipisicing cupidatat aliqua ut labore aliquip proident et non duis. Quis veniam fugiat laboris anim laborum cillum. Id ad veniam ut in incididunt ea magna nulla et adipisicing officia nulla adipisicing. Enim est nisi anim deserunt deserunt exercitation aute incididunt aute nisi aliquip. Amet adipisicing non elit mollit magna sit sunt proident.'
      ),
    );
  }
}

class Botones extends StatelessWidget {
  final IconData icon;
  final String texto;
  final MaterialColor colores;
  const Botones({
    super.key,
    required this.colores,
    required this.icon,
    required this.texto
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(icon, color: colores, size: 30),
        Text(texto),

        
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
          const Icon(Icons.star, color: Colors.red, size: 30,),
          const Text('41'),
    
        ],
    
      ),
    );
  }
}
