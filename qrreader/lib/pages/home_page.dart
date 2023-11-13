import 'package:provider/provider.dart';
import 'package:qrreader/models/scan_model.dart';
import 'package:qrreader/pages/pages.dart';
import 'package:qrreader/providers/db_provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';
import 'package:qrreader/providers/ui_provider.dart';
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
    final uiprovider = Provider.of<UiProvider>(context);
    final currentindex =uiprovider.selectedMenuOpt;
    //final tempsearch = SearchResponse(valor: 'http://www.tttt.com.py',);
    // DBProvider.db.deleteAllScan();
    // print("este es el id: ${tempsearch.id}");
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false); 
    switch(currentindex){
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();
      case 1: 
      scanListProvider.cargarScansPorTipo('http');
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}