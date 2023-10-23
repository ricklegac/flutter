import 'package:flutter/material.dart';
class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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