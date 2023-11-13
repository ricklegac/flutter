import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanBottom extends StatelessWidget {
  const ScanBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.filter_center_focus),
      onPressed:  () async {
        const barcodeScanRes = 'www.ggg.com.py'; 
        const barcodeScanRes2 = 'http://ggg.com.py'; 
        final scanListProvider = Provider.of<ScanListProvider>(context, listen:false);
        scanListProvider.nuevoScan(barcodeScanRes);
        scanListProvider.nuevoScan(barcodeScanRes2);
      },
    );
  }
}