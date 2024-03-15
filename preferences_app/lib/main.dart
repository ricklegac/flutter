import 'package:flutter/material.dart';
import 'package:preferences_app/screens/home.dart';
import 'package:preferences_app/screens/settings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName       : ( _ ) => const HomeScreen(),
        SettingsScreen.routerName   : ( _ ) => const SettingsScreen(),
      }
    );
  }
}