import 'dart:ui';

import 'package:flutter/material.dart';
class CardTable extends StatelessWidget {
  const CardTable({super.key});
  @override
  Widget build(BuildContext context) {
    return Table(
      children : 
       const [ TableRow(
          children:  [
            _SingleCard(text: 'Chart',icon: Icon(Icons.chat_sharp), colorboton: Color.fromRGBO(48,164,247,1),),
            _SingleCard(text: 'Transport',icon: Icon(Icons.emoji_transportation), colorboton: Color.fromRGBO(140, 98, 255, 1),),
            
            //_SingleCard(),
          ],
          ),
          TableRow(
          children:  [
            _SingleCard(text: 'Shopping',icon: Icon(Icons.shop_2_outlined), colorboton: Color.fromRGBO(245 ,86 ,220,1),),
            _SingleCard(text: 'Bills',icon: Icon(Icons.blinds_closed_rounded), colorboton: Color.fromRGBO(249 ,149,82,1),),
            
            //_SingleCard(),
          ],
          ),
          TableRow(
          children:  [
            _SingleCard(text: 'Entertainment',icon: Icon(Icons.tap_and_play_sharp), colorboton: Color.fromRGBO(79 ,120 ,255,1),),
            _SingleCard(text: 'Grocery',icon: Icon(Icons.local_grocery_store), colorboton: Color.fromRGBO(80 ,235 ,114,1),),
            
            //_SingleCard(),
          ],
          
          ),
          TableRow(
          children:  [
            _SingleCard(text: 'Entertainment',icon: Icon(Icons.tap_and_play_sharp), colorboton: Color.fromRGBO(79 ,120 ,255,1),),
            _SingleCard(text: 'Grocery',icon: Icon(Icons.local_grocery_store), colorboton: Color.fromRGBO(80 ,235 ,114,1),),
            
            //_SingleCard(),
          ],
          
          ),

       
        ]
        
    );
  }
}
class _SingleCard extends StatelessWidget {
  final String text;
  final Icon icon;
  final Color colorboton;
  const _SingleCard({
    super.key,
    required this.colorboton,
    required this.text,
    required this.icon,
    });

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(color: colorboton, fontSize: 20);
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
          child: Container(
            
            //margin: const EdgeInsets.all(20),
            height: 180,
            decoration:  BoxDecoration(
              color: const  Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(30),
            
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
            
              children: [
                CircleAvatar(
                  backgroundColor: colorboton,
                  radius: 30,
                  child: icon,  
                  
                ),
                const SizedBox(height: 20,),
                Text(text, style: textStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}