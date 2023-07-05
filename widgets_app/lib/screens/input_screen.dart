import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
   
  const InputScreen({Key? key}) : super(key: key);
  
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
            children: [
              TextFormField(
                autofocus: true,
                autocorrect: true,
                initialValue: 'valor inicial',
                onChanged: (value) => print('$value'),
                validator: (value) {
                  if (value ==null) return 'campo requerido';
                  return value.length<3 ? 'Minimo 3 letras' : null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  hintText: 'Nombre de usuario',
                  labelText: 'Nombre',
                  helperText: 'solo letras',
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                autofocus: true,
                autocorrect: true,
                initialValue: 'valor inicial',
                onChanged: (value) => print('$value'),
                validator: (value) {
                  if (value ==null) return 'campo requerido';
                  return value.length<3 ? 'Minimo 3 letras' : null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  hintText: 'Nombre de usuario',
                  labelText: 'Nombre',
                  helperText: 'solo letras',
                ),
              ),
            ],
          ),
         ),
      ),
    );
  }
}