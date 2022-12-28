void main(){
    final rawJson = {
        'nombre' : 'Tony Stark',
        'poder' : 'Iron Man'
    };
    final ironman = new Heroe.fromJson(rawJson);
    print(ironman);
}

class Heroe{
    String nombre;
    String poder;

    Heroe({required this.nombre, required this.poder});

    Heroe.fromJson(Map<String, String> json):
        this.nombre = json['nombre'] ?? 'no tiene nombre',
        this.poder = json['poder'] ?? 'no tiene poder';
    @override
    String toString(){
        return 'heroe: ${this.nombre} poder: ${this.poder}';
    }
}