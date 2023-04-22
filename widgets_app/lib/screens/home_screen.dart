
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
          leading: const Icon(Icons.ac_unit_sharp),
          title: const Text('Rutas'),
          onTap: () {
            final route = MaterialPageRoute(builder: (context) => const Listview1Screen());
            Navigator.push(context, route);
          } ,  
        ), 
        separatorBuilder: (_,__)=>const Divider(), 
        itemCount: 10, 
      ),
    );
  }
}