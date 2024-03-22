import 'package:flutter/material.dart';
import 'package:preferences_app/screens/home.dart';
import 'package:preferences_app/screens/settings.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';


void main() async { 
  //hacemos async para mandar llamar las init de Preferences, 
  //la que guarda los darkmodes y demas datos

  WidgetsFlutterBinding.ensureInitialized();
  
  await Preferences.init();

  runApp(const MyApp());

}


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
      },
      theme: ThemeData.light(),
    );
  }
}