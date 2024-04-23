import 'package:flutter/material.dart';
import 'package:productos_app/ui/input_decoration.dart';
import 'package:productos_app/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
   
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  const _Formulario(),   
                ],)

              ),
              const SizedBox(height: 20,),
              const Text('prueba prueba preba ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 50,),
            ],),
          )
        )
      ),
    );
  }
}

class _Formulario extends StatefulWidget {
  const _Formulario({Key? key}) : super(key: key);

  @override
  __FormularioState createState() => __FormularioState();
}

class __FormularioState extends State<_Formulario> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorationHelper.authInputDecoration(
                hintText: 'ejemplo@ejemplo.com',
                labelText: 'ejemplo',
                icono: Icons.alternate_email_sharp,
              ), 
            ),
            const SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              obscureText: !_isPasswordVisible,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorationHelper.authInputDecoration(
                hintText: 'password', 
                labelText: 'password', 
                icono: Icons.password,
                prefixIcon: Icons.lock,
                suffixIcon: IconButton(
                  onPressed: _togglePasswordVisibility,
                  icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: const Color.fromARGB(255, 34, 30, 30),
              elevation: 0,
              child:  Container(
                
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                color: Colors.deepOrangeAccent,
                
                child: const Text('Ingresar', 
                style: TextStyle(color: Colors.white)
                )
              ),
              onPressed: (){},


            )
          ],
          
        ),
        
      ),
      
    );
  }
}


