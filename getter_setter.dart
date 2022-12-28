import 'dart:math' as math;
void main(){
    final cuadrado = new Cuadrado(3);
    cuadrado.area = 25;
    print('area : ${cuadrado.calculaArea()}');
    print('lado: ${cuadrado.lado}');
    print('area get ${cuadrado.area}');
}
class Cuadrado{
    double lado;

    Cuadrado(double lado):
        this.lado = lado;

    double calculaArea(){
        return this.lado * this.lado;
    }
    double get area{
        return this.lado * this.lado;
    }
    set area(double valor){
        this.lado = math.sqrt(valor);
    }
}