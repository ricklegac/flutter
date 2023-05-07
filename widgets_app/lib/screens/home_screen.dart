
import 'package:widgets_app/router/apps_routes.dart';
import 'package:widgets_app/screens/screens.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(AppRoutes.menuOption[index].icon, color: Colors.blue),
          title: Text(AppRoutes.menuOption[index].name),
          onTap: () {
            final route = MaterialPageRoute(builder: (context) => AppRoutes.menuOption[index].screen);
            Navigator.push(context, route);
          } ,  
        ), 
        separatorBuilder: (_,__)=>const Divider(), 
        itemCount: AppRoutes.menuOption.length, 
      ),
    );
  }
}