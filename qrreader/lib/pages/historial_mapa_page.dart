import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';

class MapasPage extends StatelessWidget {
   
  const MapasPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context, listen:true);
    final scans = scanListProvider.scans;
    return ListView.builder(
      
      itemCount: scanListProvider.scans.length,
      itemBuilder: (_, int index) => ListTile(
        leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
        title:  Text(scans[index].valor),
        subtitle:  Text(scans[index].id.toString()),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
        onTap: () {
          print("abriendo");
        },
        ),
        //title: Text('http'),
      );
    
  }
}