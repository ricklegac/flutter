import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AuthBackground(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 300,),
              CardContainer(
                child:  Column(children: [
                  const SizedBox(height: 10,), 
                  Text('Login', style: Theme.of(context).textTheme.headline4),
                  const SizedBox(height: 10,),
                  _Formulario(),   
                ],)

              ),
              const SizedBox(height: 20,),
              const Text('prueba prueba preba ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
            ],),
          )
        )
      ),
    );
  }
}
class _Formulario extends StatelessWidget {
  const _Formulario({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrangeAccent)
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.deepOrangeAccent,
                  width: 2,
                ), 
              ),
              hintText: 'ejemplo@ejemplo.com',
              labelText: 'Email',
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
              prefixIcon: Icon(Icons.alternate_email, color: Colors.deepOrangeAccent)
            ),
            
          )
        ],)
      )
    );
  }
}