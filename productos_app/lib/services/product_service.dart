//es el que se encarga de las peticiones https

import 'dart:convert';

import 'package:flutter/material.dart';
import  'package:productos_app/models/product.dart';
import 'package:http/http.dart' as http;
class ProductService extends ChangeNotifier{
  final String _baseUrl = 'flutter-varios-ad03d-default-rtdb.firebaseio.com/';
  final List<Products> products = [];

  bool isLoading = true;

  //TODO hacer fetch de productos 

  ProductService(){ // cuando el product service es llamado por primera vez va a llamar al load products
    loadProducts();
  }
  Future loadProducts() async{ //load product hace la peticion, despues lo llevamos 

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body); 
    print(productsMap);
  }
}