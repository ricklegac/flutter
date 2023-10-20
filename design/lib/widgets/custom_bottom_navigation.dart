import 'package:flutter/material.dart';

class CustomNavigation extends StatelessWidget {
  const CustomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
      selectedItemColor: Colors.red,
      items: const [
        
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
           label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart),
          label: 'Graphics',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.verified_user_sharp),
          label: 'Users',
        ) 
      ],
      
    );
  }
}