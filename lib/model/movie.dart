import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/model/cast.dart';
import 'package:movie_app/utils/utils.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'original_title')
  final String originalTitle;

  @JsonKey(name: 'overview')
  final String overview;

  @JsonKey(name: 'poster_path')
  final String posterPath;

  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  @JsonKey(name: 'media_type')
  final String? mediaType;

  @JsonKey(name: 'adult')
  final bool adult;

  @JsonKey(name: 'original_language')
  final String originalLanguage;

  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;

  @JsonKey(name: 'popularity')
  final double popularity;

  @JsonKey(name: 'release_date')
  final String releaseDate;

  @JsonKey(name: 'video')
  final bool video;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  @JsonKey(name: 'runtime')
  int? runtime;

  @JsonKey(name: 'cast')
  List<CastMember> cast;

  Movie({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.runtime,
    required this.cast
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    if (json['title'] == null) {
      print('Error: title is null');
    }
    if (json['poster_path'] == null) {
      print('Error: poster_path is null');
    }

    return _$MovieFromJson(json);
  }


  Map<String, dynamic> toJson() => _$MovieToJson(this);

  List<String> get genreNames => mapGenreIdsToNames(genreIds);
}
