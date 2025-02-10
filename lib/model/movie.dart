import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/model/cast.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  factory Movie({
    required int id,
    @Default('Unknown Title') String title,
    @Default('Unknown') String originalTitle,
    @Default('No overview available') String overview,
    @Default('') String posterPath,
    String? backdropPath,
    @Default('movie') String mediaType,
    @Default(false) bool adult,
    @Default('en') String originalLanguage,
    @Default([]) List<int> genreIds,
    @Default(0.0) double popularity,
    @Default('Unknown') String releaseDate,
    @Default(false) bool video,
    @Default(0.0) double voteAverage,
    @Default(0) int voteCount,
    @Default(0) int runtime,
    @Default([]) List<CastMember> cast,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

extension MovieX on Movie {
  List<MovieGenre> get genreNames => genreIds.map((id) => MovieGenre.fromId(id)).toList();
}

enum MovieGenre {
  action(28, "Action"),
  adventure(12, "Adventure"),
  animation(16, "Animation"),
  comedy(35, "Comedy"),
  crime(80, "Crime"),
  documentary(99, "Documentary"),
  drama(18, "Drama"),
  family(10751, "Family"),
  fantasy(14, "Fantasy"),
  history(36, "History"),
  horror(27, "Horror"),
  music(10402, "Music"),
  mystery(9648, "Mystery"),
  romance(10749, "Romance"),
  scienceFiction(878, "Science Fiction"),
  tvMovie(10770, "TV Movie"),
  thriller(53, "Thriller"),
  war(10752, "War"),
  western(37, "Western"),
  unknown(-1, "Unknown");

  final int id;
  final String name;

  const MovieGenre(this.id, this.name);

  static MovieGenre fromId(int id) {
    return MovieGenre.values.firstWhere(
          (genre) => genre.id == id,
      orElse: () => MovieGenre.unknown,
    );
  }
}
