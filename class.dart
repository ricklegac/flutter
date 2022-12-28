void main(){
    final wolwerine = new Heroe();
    wolwerine.nombre = 'Logan';
    wolwerine.poder = 'poder_xd'; 
    print (wolwerine);

}
class Heroe{
    String? nombre;
    String? poder;
    @override
    String toString(){
        return 'heroe nombre: ${this.nombre} poder: ${this.poder}';
    }
}