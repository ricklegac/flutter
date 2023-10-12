import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

void main() {
  Intl.defaultLocale = 'es'; // Set the default locale
  runApp(AppState());
}
class AppState extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider(), lazy: false,),
      ],
      // lazy es cuando el provider inicialice apenas se inice
      child:const MyApp(),
    );
      
    
  }
}
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