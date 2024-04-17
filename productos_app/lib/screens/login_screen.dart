import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AuthBackground(
        child: Container(
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 300,),
              CardContainer(),
            ],),
          )
        )
      ),
    );
  }
}