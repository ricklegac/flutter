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
          child: Form(
            child: Column( //envolvemos este en un widget form porque es lo que contiene los datos
              children:   [
                const CustomInputWidget(hinText: 'Nombre usuario', icon: Icons.line_style, helperText: 'nombre', textinput: null,),
                const SizedBox(height: 16.0),
                
                const CustomInputWidget(hinText: 'Apellido usuario', icon: Icons.line_style, helperText: 'apellido',),
                const SizedBox(height: 16),
          
                const CustomInputWidget(hinText: 'Correo usuario', icon: Icons.line_style, helperText: 'correo', textinput: TextInputType.emailAddress),
                const SizedBox(height: 16),
          
                const CustomInputWidget(hinText: 'password', icon: Icons.password, helperText: 'password', obscureText: true,),
                const SizedBox(height: 16),
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('guardar')),
                  ),
                  onPressed: () {
          
                  } , 
                  )
              ],
            ),
          ),
         ),
      ),
    );
  }
}

