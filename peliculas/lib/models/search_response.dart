
import 'dart:convert';

import 'package:peliculas/models/models.dart';

class SearchResponse {
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    SearchResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory SearchResponse.fromRawJson(String str) => SearchResponse.fromJson(json.decode(str));

 

    factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

   
}
