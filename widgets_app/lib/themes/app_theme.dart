import 'package:flutter/material.dart';

class AppTheme{
   static const Color primary = Colors.indigo;
   static final ThemeData temaLight = ThemeData.light().copyWith(
    primaryColor: Colors.indigo,
        //appbar theme
        appBarTheme: const  AppBarTheme(
          color: Colors.indigo,
          elevation: 0,
        )
   );
}