
import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final String? hinText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? textinput;
  final bool obscureText; 
  const CustomInputWidget({
    Key? key, 
    this.hinText, 
    this.labelText, 
    this.helperText, 
    this.icon, 
    this.suffixIcon, 
    this.textinput, 
    this.obscureText = false,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    
    return TextFormField(
      autofocus: true,
      autocorrect: true,
      initialValue: 'valor inicial',
      keyboardType: textinput,
      obscureText: obscureText,
      //onChanged: (value) => print('$value'),
      validator: (value) {
        if (value ==null) return 'campo requerido';
        return value.length<3 ? 'Minimo 3 letras' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hinText,
        labelText: labelText,
        helperText: helperText,
        icon: icon == null ? null : Icon(icon),
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
      ),
    );
  }
}