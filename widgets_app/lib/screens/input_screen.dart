import 'package:flutter/material.dart';
import 'package:widgets_app/widgets/widgets.dart';

class InputScreen extends StatelessWidget {
  final String? hinText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  
  const InputScreen({
    Key? key, //todos los widgets ahora tiene un key
    this.hinText, 
    this.labelText, 
    this.helperText, 
    this.icon, 
    this.suffixIcon,
    }) : super(key: key);
  
  @override
  
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, String> formvalues = {
        'first_name' : 'ricardo',
        'last_name' : 'leguizamon',
        'email' : 'cualquiera@gamicsa.com',
        'password' : '12345', 
        'role' : 'admin'
    };
    return  Scaffold(
      appBar: AppBar(
        title: const Text('inputs'),
      ),
      body: SingleChildScrollView(
         child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column( //envolvemos este en un widget form porque es lo que contiene los datos
              children:   [
                CustomInputWidget(hinText: 'Nombre usuario', icon: Icons.line_style, helperText: 'nombre', textinput: null, formPoperty: 'first_name', formValues: formvalues,),
                const SizedBox(height: 16.0),
                
                CustomInputWidget(hinText: 'Apellido usuario', icon: Icons.line_style, helperText: 'apellido',formPoperty: 'last_name', formValues: formvalues,),
                const SizedBox(height: 16),
          
                CustomInputWidget(hinText: 'Correo usuario', icon: Icons.line_style, helperText: 'correo', textinput: TextInputType.emailAddress,formPoperty: 'email', formValues: formvalues,),
                const SizedBox(height: 16),
          
                CustomInputWidget(hinText: 'password', icon: Icons.password, helperText: 'password', obscureText: true,formPoperty: 'password', formValues: formvalues,),
                const SizedBox(height: 16),
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('guardar')),
                  ),
                  onPressed: () {
                    //FocusScope.of(context).requestFocus(FocusNode()); // ocultamos el teclado 
                    if (!myFormKey.currentState!.validate()){
                      
                      print('formaulario no valido');
                      return;
                    }
                    print(formvalues);
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

