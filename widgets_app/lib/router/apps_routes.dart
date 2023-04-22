import 'package:widgets_app/screens/screens.dart';
class AppRoutes{
  static const initialRoute = 'home'; //estatico como global
  static Map<String, Widget Function(BuildContext)> routes = {
    'home'      :(BuildContext context )=> const HomeScreen(),
    'listview1' :(BuildContext context) => const Listview1Screen(),
    'listview2' :(context) => const Listview2Screen(),
    'alert'     :((context) => const AlertScreen()),
    'card'      :(context) => const CardScreen(),
  };

}