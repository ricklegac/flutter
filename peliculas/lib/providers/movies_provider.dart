import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier{ // para que sea un provider debe de extender de changenotifier

  MovieProvider(){
    print('movie provider inicializado');
    this.getNowPlaying();
    }
  getNowPlaying()
  {
    print('getnowplaying');
  } 
}