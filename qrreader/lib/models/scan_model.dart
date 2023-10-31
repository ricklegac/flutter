import 'dart:convert';

SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
    int? id;
    String? tipo;
    String valor;

    SearchResponse({
         this.id,
         this.tipo,
        required this.valor,
    }){
      if(this.valor.contains("http")){
        this.tipo = 'http';
      }else{
        this.tipo='geo';
      }
    }

    factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
