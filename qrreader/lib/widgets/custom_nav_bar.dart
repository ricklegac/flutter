import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/ui_provider.dart';
class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<UiProvider>(context);
    final currrentIndex = uiprovider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (int i ) {
        uiprovider.selectedMenuOpt = i; 
      },
      currentIndex: currrentIndex ,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.maps_ugc),
          label: 'mapa',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'direcciones',
          ),
      ],

    );
  }
}