import 'package:flutter/material.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:preferences_app/widgets.dart/widgets.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
   
  static const String routerName = 'Settings'; 
  
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {



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
                  value: Preferences.isDarkmode, 
                  title: const Text('Darkmode'),
                  onChanged: (value ) {
                    Preferences.isDarkmode = value;
                    final themeProvider = Provider.of(context)<ThemeProvider>(context, listen: false);

                    value 
                    ? themeProvider.setDarkMode()
                    : themeProvider.setLightMode();
                    setState(() {
                      
                    });
                  },
                ),
                 const Divider(),

                 RadioListTile<int>(
                  value: 1, 
                  groupValue: Preferences.gender, // es lo que va a cambiar, valor que se le coloca en el gender  
                  title: const Text('masculino'),
                  onChanged: (value ) {
                    Preferences.gender = value ?? 1;
                    setState(() {
                      
                    });
                  }),
                const Divider(),

                 RadioListTile<int>(
                  value: 2, 
                  groupValue: Preferences.gender, // es lo que va a cambiar,  
                  title: const Text('femenino'),
                  onChanged: (value ) {
                    Preferences.gender = value ?? 2;
                    setState(() {
                      
                    });
                  }),
                    
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      initialValue: Preferences.name,
                      onChanged: (value) {
                        setState(() {
                          Preferences.name = value;
                          
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