void main(){
    final superman = new Heroe('clark kent','superman');
    print(superman);


}

abstract class Personaje{
    String poder;
    String nombre;
    Personaje(this.nombre, this.poder);
    @override
    String toString(){
        return '${this.nombre} - ${this.poder}';
    }
}

class Heroe extends Personaje{
    Heroe(String nombre, String poder): super(nombre,poder);

}