import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: true);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => Dismissible(
        key: Key(scans[index].id.toString()), // Use a key based on the item's id
        onDismissed: (direction) {
  Provider.of<ScanListProvider>(context, listen: false)
      .borrarScanPorId(scans[index].id ?? 0);
},

        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.delete, color: Colors.white),
        ),
        child: ListTile(
          leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
          title: Text(scans[index].valor),
          subtitle: Text(scans[index].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () {
            print("abriendo");
          },
        ),
      ),
    );
  }
}
