import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
   
  const Background({Key? key}) : super(key: key);
  final boxDecoration =  const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0XFF2E305F),
            Color(0xff202333),
          ]
        ),
      );
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children:[
        Container(
        decoration: boxDecoration,
      ),
      const Positioned(
        top: -100,
        left: -30,
        child:  _PinkBox()
      ),

      ] 
    );
  }
}

class _PinkBox extends StatelessWidget {
  const _PinkBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            colors: [
            Color.fromRGBO(236, 98, 188, 1),
            Color.fromRGBO(241, 142, 172, 1),
            ])
         ),
      ),

    );
  }
}