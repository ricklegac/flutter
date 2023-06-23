import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;
class AnimatedScreen extends StatefulWidget {
   
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.red;
  BorderRadiusGeometry _BorderRadius = BorderRadius.circular(20);
  //int _i = 100;
  void changeShape(){
  var generatedColor = Random().nextInt(Colors.primaries.length);
  Colors.primaries[generatedColor];
  _width += 10;
  _height += 10;
  _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  setState(() {
    
  });
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('animated widget'),
      ),
      body:  Center(
         child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.bounceOut,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _BorderRadius,
          ),

         ),
      ),
      floatingActionButton: FloatingActionButton(
        child:  const Icon(Icons.play_arrow, size: 30),
        onPressed:( ){
          changeShape();
        }
         ),
         
    );
  }
}