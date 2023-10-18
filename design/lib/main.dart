import 'package:design/screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'basic_design'  : (BuildContext context) => const BasicScreen(),
        'scroll_design' : (BuildContext context) => const ScrollScreen(),
        'home_screen'   : (BuildContext context) => const HomeScreen(),
      },
      title: 'Material App',
      initialRoute: 'scroll_design',
      
    );
  }
} 