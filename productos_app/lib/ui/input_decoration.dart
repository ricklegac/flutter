import 'package:flutter/material.dart';

class InputDecorationHelper{ //metodos y propiedades estaticas
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? icono, 
    IconData? prefixIcon,
    IconButton? suffixIcon,
    bool obscureText = false,
    
  }){
    return  InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepOrangeAccent)
      ),
      focusedBorder:const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.deepOrangeAccent,
        width: 2,
      )),
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.grey,
      ),
      prefixIcon: icono != null 
      ? Icon(icono, color: Colors.deepOrangeAccent) 
      :  null,
      suffixIcon: suffixIcon,
    );
  }    
}  