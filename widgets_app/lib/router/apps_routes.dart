import 'package:widgets_app/models/models.dart';
import 'package:widgets_app/screens/screens.dart';
class AppRoutes{ // si no tiene un _ es porque se esta exportando, es publico _AppRoutes  
static const initialRoute = 'home'; //estatico como global

static final menuOption = <MenuOption>[
  MenuOption(route: 'home', name: 'Home Screen', screen: const HomeScreen() , icon: Icons.home),
  MenuOption(route: 'listview1', name: 'List View 1', screen: const Listview1Screen() , icon: Icons.list_sharp),
  MenuOption(route: 'listview2', name: 'List View 2', screen: const Listview2Screen() , icon: Icons.list_alt_outlined),
  MenuOption(route: 'alert', name: 'alert', screen: const AlertScreen() , icon: Icons.add_alert_sharp),
  MenuOption(route: 'card', name: 'card', screen: const CardScreen() , icon: Icons.card_giftcard),
  MenuOption(route: 'avatar', icon: Icons.supervised_user_circle, name: 'avatar', screen: const AvatarScreen()),
  MenuOption(route: 'animated_screen', icon:Icons.animation, name: 'animated screen', screen: const AnimatedScreen()),
  MenuOption(route: 'input_screen', icon: Icons.input, name: 'input screen',screen: const InputScreen()),
  MenuOption(route: 'slider_screen', icon: Icons.slideshow, name: 'slider screen', screen: const SliderScreen()),
  MenuOption(route: 'Builder_Screen', icon: Icons.build, name: 'Builder screen', screen: const ListViewBuilderScreen()),
];
  static Map<String, Widget Function(BuildContext)> getAppRoutes(){
    Map<String, Widget Function(BuildContext)> appRoutes = {
      'home'      :(BuildContext context )=> const HomeScreen(),
    }; // un string apunta a un widget
    for (final options in menuOption){
        appRoutes.addAll({options.route:(BuildContext context ) => options.screen  }); 
    }  

    return appRoutes;
  }
  static Map<String, Widget Function(BuildContext)> routes = {
    'home'      :(BuildContext context )=> const HomeScreen(),
    'listview1' :(BuildContext context) => const Listview1Screen(),
    'listview2' :(context) => const Listview2Screen(),
    'alert'     :((context) => const AlertScreen()),
    'card'      :(context) => const CardScreen(),
    'avatar screen': (context) => const AvatarScreen(),
    'animated Screen': (context) => const AnimatedScreen(),
  };
 
}