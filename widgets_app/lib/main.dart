 

import 'package:widgets_app/router/apps_routes.dart';

import 'screens/screens.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
     //home: const Listview2Screen(),
      //initialRoute: 'home',
      initialRoute: AppRoutes.initialRoute, // se agregan las rutas de la Class AppRoutes
      // routes: {
      //   'home'      :(BuildContext context )=> const HomeScreen(),
      //   'listview1' :(BuildContext context) => const Listview1Screen(),
      //   'listview2' :(context) => const Listview2Screen(),
      //   'alert'     :((context) => const AlertScreen()),
      //   'card'      :(context) => const CardScreen(),
      // },
      routes:  AppRoutes.getAppRoutes() ,
  );
  }
}