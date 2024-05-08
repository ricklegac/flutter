//es el que se encarga de las peticiones https

import 'package:flutter/material.dart';
import  'package:productos_app/models/product.dart';
class ProductService extends ChangeNotifier{
  final String _baseUrl = 'flutter-varios-ad03d-default-rtdb.firebaseio.com/';
  final List<Products> products = [];

  //TODO hacer fetch de productos 

}