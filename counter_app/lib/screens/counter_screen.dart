import 'package:flutter/material.dart';


class  CounterScreen extends StatefulWidget{
  
  const CounterScreen ({super.key});
  
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;
  void incrementar(){
    counter++;
    setState(() {
      
    });
  }
  void decrementar(){
    counter--;
    setState(() {});
  }
  void cerear(){
    counter=0;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    const fontsize30 = TextStyle(fontSize: 30);
        // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 113, 154, 226)  ,
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 2.0  , 
      ), 
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text('numero de clicks',style: TextStyle(fontSize: 20) ),
          Text('$counter', style: fontsize30,),
        ],
           
      ),
      
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: Fnaction(
      incremento: incrementar,
      decremento: decrementar,
      cero: cerear
    ),
    );
  }
}

class Fnaction extends StatelessWidget {
  final Function incremento, decremento, cero;
  const Fnaction({
    Key? key, required this.incremento, required this.decremento, required this.cero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
      children:  [
         FloatingActionButton(
          onPressed: () => incremento(),
          child: const Icon(Icons.plus_one_rounded),
        
        ),
        //const SizedBox(width: 20),   
         FloatingActionButton(
          onPressed: () => cero(),
          child: const Icon(Icons.exposure_zero),
          
        ),
        //const SizedBox(width: 20),   
         FloatingActionButton(
          onPressed: () => decremento() ,
          child: const Icon(Icons.exposure_minus_1),
          
        ),
        
      ],
    );
  }
}