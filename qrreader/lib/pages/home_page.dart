import 'package:qrreader/pages/pages.dart';
import 'package:qrreader/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.green,
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const  Icon(Icons.delete_forever),
            ),
            
        ],
    
      ),
      body: _BodyPage(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanBottom(),
    );
  }
}
class _BodyPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final currentindex =1;
    switch(currentindex){
      case 0:
        return MapasPage();
      case 1: 
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}