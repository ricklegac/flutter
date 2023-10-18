import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
   
  const ScrollScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: const [
          Page1(),
          Page2(),
        ],
        
      )
    );
      
    
  }
}
class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(79, 194, 221, 1.0 ),
    );
  }
}
class Page1 extends StatelessWidget {
  const Page1({
    super.key,
  });

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
    

    const textStyle = TextStyle(fontSize: 70, fontWeight: FontWeight.bold, color: Colors.white, decoration: TextDecoration.none);
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            const Text('11º', style: textStyle,),
            const Text('Miercoles', style: textStyle),
            Expanded(child: Container()),
            const Icon(Icons.keyboard_arrow_down,size: 100, color: Colors.white),
          ],
        ),
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