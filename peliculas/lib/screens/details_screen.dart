import 'package:flutter/material.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Peliculas'),
        
      ),
      body:  const Center(
        child: Text('details screen'),
      ),
    );
  }
}