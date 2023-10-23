import 'package:flutter/material.dart';
import 'package:qrreader/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader',
      initialRoute: 'home',
      routes: {
        'home':( _ ) => const HomePage(),
        'mapas': ( _ ) => const MapaPage(),
      }
      
     
    );
  }
}