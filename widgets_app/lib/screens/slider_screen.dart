import 'package:flutter/material.dart';
import 'package:widgets_app/themes/app_theme.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Text'),
      ),
      body: Column(
        children:  [
          Slider.adaptive(
            min: 50,
            max:700,
            activeColor: AppTheme.primary,
            value: _sliderValue, 
            onChanged: _sliderEnabled 
            ? (value) {
              _sliderValue = value;
              setState(() {
                
              });
              
              print (value);
            } : null
          ),
          Checkbox(
            value: _sliderEnabled, 
      
            onChanged: (value) {
              _sliderEnabled = value ?? true;
              setState(() {
                
              });
            }
            ),
            CheckboxListTile(
              title: const Text('habilitar slider'),
              value: _sliderEnabled, 
              onChanged: (value){
                _sliderEnabled =value ?? true;
                setState(() {
                  
                });
              }),
              
          Expanded( // para que agarre lo restante del tamaño de la Columna 
            child: SingleChildScrollView(
              child: Image(
                image: NetworkImage('https://i.pinimg.com/564x/2f/ea/a3/2feaa346bd96e29c20ccacf92acd7f16.jpg'),
                fit: BoxFit.contain,
                width: _sliderValue,
                ),
            ),
          ),
            const SizedBox(width: 100,)
        ],
      )
    );
    
  }
}
