import 'package:flutter/material.dart';
class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currrentIndex = 1;
    return BottomNavigationBar(
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