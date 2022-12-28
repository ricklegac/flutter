void main(){
	final nombre = 'Ricardo';
	final mensaje = 'hola';
	saludo(nombre);

}
void saludo(String nombre, [String mensaje = 'no saludo']){
	print('$mensaje $nombre');
}