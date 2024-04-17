import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,),
      
      child: Container(
        width: double.infinity,
        height: 300, //TODO: borrar 
        decoration: createCardShape(),
      ),
    );
  }

  BoxDecoration createCardShape() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 15,
          offset: Offset(0,0),
        )
      ]
      
    );
  }
}