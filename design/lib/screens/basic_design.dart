import 'package:flutter/material.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage('assets/landscape.jpg')),
      ),
    );
  }
}
