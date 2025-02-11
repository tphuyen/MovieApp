import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/model/cast.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  factory Movie({
    required int id,
    @JsonKey(name: 'title') @Default('Unknown Title') String title,
    @JsonKey(name: 'original_title') @Default('Unknown') String originalTitle,
    @JsonKey(name: 'overview') @Default('No overview available') String overview,
    @JsonKey(name: 'poster_path') @Default('') String posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'media_type') @Default('movie') String mediaType,
    @JsonKey(name: 'adult') @Default(false) bool adult,
    @JsonKey(name: 'original_language') @Default('en') String originalLanguage,
    @JsonKey(name: 'genre_ids') @Default([]) List<int> genreIds,
    @JsonKey(name: 'popularity') @Default(0.0) double popularity,
    @JsonKey(name: 'release_date') @Default('Unknown') String releaseDate,
    @JsonKey(name: 'video') @Default(false) bool video,
    @JsonKey(name: 'vote_average') @Default(0.0) double voteAverage,
    @JsonKey(name: 'vote_count') @Default(0) int voteCount,
    @JsonKey(name: 'runtime') @Default(0) int runtime,
    @JsonKey(name: 'cast') @Default([]) List<CastMember> cast,
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
