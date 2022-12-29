//async 

void main(){
  print("a");
  //final data = await httpGet('aaa');
  // httpGet('aaa').then((data){
  //   print(data.toUpperCase());
  // });
  final nombre = getNombre('20');
  print (nombre);
  print("b");


  
}

Future<String> httpGet(String url){
  return Future.delayed(Duration(seconds: 2),funcionImprimir);
}

String funcionImprimir(){
  return 'funcion_cualquiera';
}

Future<String> getNombre(String id) async {
  return '$id - nombre';
}