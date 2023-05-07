import 'package:widgets_app/screens/screens.dart';


class MenuOption{
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  MenuOption(
    { 
    required this.route, 
    required this.icon, 
    required this.name, 
    required this.screen}
    ); // las llaves son para que el usuario envie con su orden 
}