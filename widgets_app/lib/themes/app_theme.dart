import 'package:flutter/material.dart';

class AppTheme{
   static const Color primary = Colors.indigo;
   static final ThemeData temaLight = ThemeData.light().copyWith(
    primaryColor: Colors.indigo,
        //appbar theme
        appBarTheme: const  AppBarTheme(
          color: Colors.indigo,
          elevation: 0,
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        shape: const StadiumBorder(),
        elevation: 0
      ),  
    ),
    
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color:primary),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),

      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
        
      )
    ),
   );
}
