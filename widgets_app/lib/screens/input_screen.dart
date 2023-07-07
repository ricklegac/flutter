import 'package:flutter/material.dart';
import 'package:widgets_app/widgets/widgets.dart';

class InputScreen extends StatelessWidget {
  final String? hinText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  
  const InputScreen({
    Key? key, 
    this.hinText, 
    this.labelText, 
    this.helperText, 
    this.icon, 
    this.suffixIcon,
    }) : super(key: key);
  
  @override
  
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('inputs'),
      ),
      body: SingleChildScrollView(
         child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: const [
              CustomInputWidget(hinText: 'Ricardo', icon: Icons.line_style, helperText: 'nombre',),
              SizedBox(height: 16.0),
              
            ],
          ),
         ),
      ),
    );
  }
}

