import 'package:flutter/material.dart';

class Background extends StatelessWidget {
   
  const Background({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0XFF2E305F),
            Color(0xff202333),
          ]
        ),
      ),
    );
  }
}