//import 'package:meta/meta.dart';
import 'package:peliculas/models/movie.dart';
import 'dart:convert';


class PopularResponse {
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    PopularResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory PopularResponse.fromRawJson(String str) => PopularResponse.fromJson(json.decode(str));


    factory PopularResponse.fromJson(Map<String, dynamic> json) => PopularResponse(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

}