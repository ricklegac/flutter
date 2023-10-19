import 'package:flutter/material.dart';


class PageTile extends StatelessWidget {
  
  const PageTile({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, decoration: TextDecoration.none);
    return  const SafeArea(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Classify Transaction', style: textStyle,),
          SizedBox(height: 10,),
          Text('Classify this transaction into a particular category', style: TextStyle(fontSize: 12, color: Colors.white,decoration: TextDecoration.none),),
        ],
      ),
    );
  }
}