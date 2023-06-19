import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String inputFilePath = '/Users/rick/Desktop/codes/scripts.py/datos.txt';
  final String outputFilePath = '/Users/rick/Desktop/codes/scripts.py/output.csv';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                convertSpacesToTabs();
              },
              child: Text('Convertir espacios a tabuladores'),
            ),
            ElevatedButton(
              onPressed: () {
                processData();
              },
              child: Text('Procesar datos'),
            ),
          ],
        ),
      ),
    );
  }

  void convertSpacesToTabs() {
    File(inputFilePath).readAsString().then((fileContent) {
      String modifiedContent = fileContent.replaceAll(RegExp(r' {3,}'), '@');
      File(outputFilePath).writeAsString(modifiedContent);
      print('Archivo convertido exitosamente');
    });
  }

  void processData() {
    File(outputFilePath).readAsLines().then((lines) {
      List<List<dynamic>> data = [];

      for (String line in lines) {
        List<dynamic> row = line.split('@');
        data.add(row);
      }

      List<String> header = ['Codigo', 'Producto', 'Precio'];
      List<Map<String, dynamic>> jsonList = [];

      for (List<dynamic> row in data) {
        Map<String, dynamic> jsonData = {};

        for (int i = 0; i < header.length; i++) {
          jsonData[header[i]] = row[i];
        }

        jsonList.add(jsonData);
      }

      // Procesar los datos según tus necesidades
      // ...

      print(jsonList);
    });
  }
}
