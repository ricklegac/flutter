// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Map<String, Products> productsFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, Products>(k, Products.fromJson(v)));

String productsToJson(Map<String, Products> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Products {
    bool available;
    String name;
    String? picture;
    double price;

    Products({
        required this.available,
        required this.name,
        this.picture,
        required this.price,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => { //nos va a servir para mandar al servidor 
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
    };
}
