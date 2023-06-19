 

import 'package:widgets_app/router/apps_routes.dart';
import 'package:widgets_app/themes/app_theme.dart';

import 'screens/screens.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute, // se agregan las rutas de la Class AppRoutes
      routes:  AppRoutes.getAppRoutes() ,
      theme: AppTheme.temaLight,
    );
  }
}