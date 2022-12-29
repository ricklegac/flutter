//promesas que es en javascript
//tast en c#
//se hace a destiempo despues del programa 

void main(){
  print("a");
  httpGet('aaa').then((data){
    print(data.toUpperCase());
  });
  print("b");


  
}

Future<String> httpGet(String url){
  return Future.delayed(Duration(seconds: 2),funcionImprimir);
}

String funcionImprimir(){
  return 'funcion_cualquiera';
}