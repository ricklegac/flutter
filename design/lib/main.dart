import 'package:design/screens/basic_design.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'basic_design': (BuildContext context) => BasicScreen(),
      },
      title: 'Material App',
      initialRoute: 'basic_design',
      
    );
  }
} 