import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  
  final Widget child;

   CardContainer({
    super.key,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,),
      
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        //height: 300, //TODO: borrar 
        decoration: createCardShape(),
        child: child, //el child que llamaamos en CardContainer
      ),
    );
  }

  BoxDecoration createCardShape() { // la sombra del card
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