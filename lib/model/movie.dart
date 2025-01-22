import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/model/cast.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie{
  final String imageUrl;
  final String title;
  final double rating;
  final List<String> genre;
  final String duration;
  final String language;
  final String age;
  final String description;
  final String filmBgTrailer;
  final List<CastMember> cast;

  const Movie({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.genre,
    required this.duration,
    required this.language,
    required this.age,
    required this.description,
    required this.filmBgTrailer,
    required this.cast
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}