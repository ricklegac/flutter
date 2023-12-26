import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:qrreader/pages/pages.dart';

import 'package:qrreader/providers/scan_list_provider.dart';
import 'package:qrreader/providers/ui_provider.dart';
import 'package:qrreader/widgets/widgets.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.green,
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
  onPressed: () {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete all scans?'),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                scanListProvider.borrarTodos();
                Navigator.of(context).pop(); // Close the dialog
              },
              isDestructiveAction: true,
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  },
  icon: const Icon(Icons.delete_forever),
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
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false); 
    switch(currentindex){
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();
      case 1: 
        scanListProvider.cargarScansPorTipo('http');
        return MapsPage();
      default:
        return MapasPage();
    }
  }
}