//async 

void main() async {
  print("a");
  //final data = await httpGet('aaa');
  // httpGet('aaa').then((data){
  //   print(data.toUpperCase());
  // });
  final nombre = await getNombre('20');
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