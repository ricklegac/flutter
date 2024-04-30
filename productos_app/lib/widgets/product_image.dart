import 'package:flutter/material.dart';
class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        width: double.infinity,
        height: 450,
        decoration: _BuildBoxDecoration(),
        child: const ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: FadeInImage(
            image: AssetImage('./assets/jar-loading.gif'),
            placeholder: AssetImage('./assets/jar-loading.gif'),
            fit: BoxFit.cover,
          ),
        ),

      ));
  }

  BoxDecoration _BuildBoxDecoration() => const  BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
    boxShadow: [
      BoxShadow(
        color: Colors.black,
        blurRadius: 10,
        offset: Offset(0, 5)
      )
    ]
  );
}