import 'package:flutter/material.dart';
import 'package:qrreader/pages/pages.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home':( _ ) => const HomePage(),
          'mapas': ( _ ) => const MapaPage(),
        },
        
        theme: ThemeData(
          primaryColor: Colors.green,
          primarySwatch: Colors.green,
          floatingActionButtonTheme:const  FloatingActionButtonThemeData(
            backgroundColor: Colors.green,
            
          )
    
        ) , 
      ),
    );
  }
}