import 'package:flutter/material.dart';



class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      child: Column(
        children:  [
           const FadeInImage(
            
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image:  NetworkImage('https://hips.hearstapps.com/hmg-prod/images/ballooning-pink-sky-rcg2wh-1531753930.jpg?crop=1xw:1xh;center,top&resize=980:*'),
            width: double.infinity,       
            height: 230,  
            fit: BoxFit.cover,   
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: const Text('texto cualquiera'),

            ),
        ],
      ),
    );
  }
}
