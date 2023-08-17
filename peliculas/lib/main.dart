import 'package:flutter/material.dart';
import 'package:peliculas/screens/screens.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => const HomeScreen(),
        'DetailScreen': ( _ ) => const DetailsScreen(),

      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const  AppBarTheme(
          color: Colors.indigo,
        )
      ),

    );
  }
}