import 'package:flutter/material.dart';
import 'package:productos_app/provider/login_form_provider.dart';
import 'package:productos_app/ui/input_decoration.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
                  ChangeNotifierProvider(
                    create: ( _ ) => LoginFormProvider(),
                    child: const _Formulario(),
                  )
                   
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

    final loginForm = Provider.of<LoginFormProvider>(context); 

    return Container(
      child: Form(
        // TODO: mantener referencia al Key
        key: loginForm.formKey, // asociamos el key 
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                ? null
                : 'el correo no es valido';               
              },
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
              onChanged: (value) => loginForm.password = value ,
              validator: (value) {
                RegExp regex =  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                if (value!.isEmpty) {
                  return 'Please enter password';
                } else {
                if (!regex.hasMatch(value)) {
                  return 'Enter valid password';
                } else {
                  return null;
                 }
    }
              },
            ),
            const SizedBox(height: 30,),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepOrangeAccent,
              onPressed : loginForm.isLoading ? null : () async {
                FocusScope.of(context).unfocus; // ocultar el teclado
              
                if(!loginForm.isValidForm()) return;
                loginForm.isLoading = true;
                await Future.delayed(const Duration(seconds: 2));
                //TODO: validar el loading, en el backend 
                loginForm.isLoading = false;
                Navigator.pushReplacementNamed(context, 'home');
                

              },
              child:  SizedBox(
                //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                //color: Colors.deepOrangeAccent,
                
                child:  Text(
                  loginForm.isLoading ? 'Espere' : 'Ingresar', 
                  style: const TextStyle(color: Colors.white)
                )
              ),
              


            )
          ],
          
        ),
        
      ),
      
    );
  }
}


