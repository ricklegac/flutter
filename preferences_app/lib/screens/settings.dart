import 'package:flutter/material.dart';
import 'package:preferences_app/widgets.dart/widgets.dart';

class SettingsScreen extends StatefulWidget {
   
  static const String routerName = 'Settings'; 
  
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool isDarkMode = false;
  int gender = 1;
  String name = 'Ricardo';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('settings'),
      ),
      drawer:   const SideMenu(),
        body:   Padding(
          padding:  const EdgeInsets.all(8.0), 
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const Text('Settings', style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
                 const Divider(),
                 SwitchListTile.adaptive(
                  value: isDarkMode, 
                  title: const Text('Darkmode'),
                  onChanged: (value ) {
                    isDarkMode = value;
                    setState(() {
                      
                    });
                  },
                ),
                 const Divider(),

                 RadioListTile<int>(
                  value: 1, 
                  groupValue: gender, // es lo que va a cambiar, valor que se le coloca en el gender  
                  title: const Text('masculino'),
                  onChanged: (value ) {
                    gender = value ?? 1;
                    setState(() {
                      
                    });
                  }),
                const Divider(),

                 RadioListTile<int>(
                  value: 2, 
                  groupValue: gender, // es lo que va a cambiar,  
                  title: const Text('femenino'),
                  onChanged: (value ) {
                    gender = value ?? 2;
                    setState(() {
                      
                    });
                  }),
                    
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      initialValue: '',
                      onChanged: (value) {
                        setState(() {
                          name = value;
                          
                        });
                      }
                      ,
                      decoration: const InputDecoration(
                        labelText: 'nombre',
                        helperText: 'nombre usuario',
                      )
                    ),
                  )


              ],
            ) ,
            ),
        ),
      );
  }
}