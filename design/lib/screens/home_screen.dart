import 'package:design/widgets/background.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        //background 
        Background()
      ],

    );
  }
}