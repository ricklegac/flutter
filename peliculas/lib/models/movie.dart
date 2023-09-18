import 'dart:convert';
class Result {
    Result({
        required this.adult,
        this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        this.posterPath,
        this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    bool adult;
    String? backdropPath;
    List<int> genreIds;
    int id;
    String originalLanguage;
    String originalTitle;
    String overview;
    double popularity;
    String? posterPath;
    String? releaseDate;
    String title;
    bool video;
    double voteAverage;
    int voteCount;

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    //String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );
    get fullPosterImg{
      if(posterPath != null){
        return 'https://image.tmdb.org/t/p/w500${this.posterPath}';
      }
      else{
        return 'https://i.stack.imgur.com/GNhxO.png';
      }
    }

    // Map<String, dynamic> toJson() => {
    //     "adult": adult,
    //     "backdrop_path": backdropPath,
    //     "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    //     "id": id,
    //     "original_language": originalLanguageValues.reverse[originalLanguage],
    //     "original_title": originalTitle,
    //     "overview": overview,
    //     "popularity": popularity,
    //     "poster_path": posterPath,
    //     "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    //     "title": title,
    //     "video": video,
    //     "vote_average": voteAverage,
    //     "vote_count": voteCount,
    // };
}

// enum OriginalLanguage {
//     EN
// }

// final originalLanguageValues = EnumValues({
//     "en": OriginalLanguage.EN
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }
