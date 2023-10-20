import 'package:design/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Stack(
        children: [
          //background 
          Background(), 
    
          _HomeBody(),

          
        ],
        
      ),
      bottomNavigationBar:CustomNavigation(),
    );
    
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          PageTile(),
          
          CardTable(),
        ],
      ),
    );
  }
}