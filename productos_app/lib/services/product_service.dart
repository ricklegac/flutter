//es el que se encarga de las peticiones https
import  'package:productos_app/models/product.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ProductService extends ChangeNotifier{
  final String _baseUrl = 'flutter-varios-ad03d-default-rtdb.firebaseio.com';
  final List<Products> products = [];
  late Products selectedProduct;

  bool isLoading = true;

  //TODO hacer fetch de productos 

  ProductService(){ // cuando el product service es llamado por primera vez va a llamar al load products
    loadProducts();
  }
  Future loadProducts() async{ //load product hace la peticion, despues lo llevamos 

    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body); 
    int i = 0;
    productsMap.forEach((key,value) { // el key es id del producto y el value es todo el resto  
      final tempProduct = Products.fromJson(value);
      tempProduct.id = key;
      products.add(tempProduct);
      print("\n${products[i].name}");
      i++;
    });

    isLoading = false;
    notifyListeners();
    //print(productsMap);
  }
}