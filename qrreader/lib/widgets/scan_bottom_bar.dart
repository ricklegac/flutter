import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanBottom extends StatelessWidget {
  const ScanBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.filter_center_focus),
      onPressed:  () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //                                             COLOR_CODE, 
        //                                             CANCEL_BUTTON_TEXT, 
        //                                             isShowFlashIcon, 
        //                                             scanMode);
      },
    );
  }
}