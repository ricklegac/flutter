void main(){
    final wolwerine = new Heroe('logan','poder_xd');
    // wolwerine.nombre = 'Logan';
    // wolwerine.poder = 'poder_xd'; 
    print (wolwerine);

}
class Heroe{
    String? nombre;
    String? poder;
    @override
    Heroe(String pNombre, String pPoder){
        this.nombre = pNombre;
        this.poder = pPoder;    
    }
    String toString(){
        return 'heroe nombre: ${this.nombre} poder: ${this.poder}';
    }
}