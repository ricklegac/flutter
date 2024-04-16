import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      width: double.infinity,
      height: double.infinity,
      child:  Stack(
        children: [
          const _PurpleBox(),
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 200,
              //margin: const EdgeInsets.only(top:30),
              child: const Icon(Icons.person_pin, color: Colors.white, size:100),
              //color: Colors.red
            ),
          )
        ]
      )
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      //color: Colors.indigo,
      decoration: purpleBackgroud(),
      child: Stack(
        children: [
          Positioned(top:60,left:90, child: _Bubble()),
          Positioned(top:30,left:10, child: _Bubble()),
          Positioned(top:-40,left:10, child: _Bubble()),
          Positioned(bottom:90,left:90, child: _Bubble()),
          Positioned(bottom:-50,right:30, child: _Bubble()),
          Positioned(bottom:80,right:10, child: _Bubble())
        ],
      ),
    );
  }

  BoxDecoration purpleBackgroud() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(63,63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1),
      ]

      )
  );
}

class _Bubble extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05), 
      ),
    );
  }
}