// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      rating: (json['rating'] as num).toDouble(),
      genre: (json['genre'] as List<dynamic>).map((e) => e as String).toList(),
      duration: json['duration'] as String,
      language: json['language'] as String,
      age: json['age'] as String,
      description: json['description'] as String,
      filmBgTrailer: json['filmBgTrailer'] as String,
      cast: (json['cast'] as List<dynamic>)
          .map((e) => CastMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'rating': instance.rating,
      'genre': instance.genre,
      'duration': instance.duration,
      'language': instance.language,
      'age': instance.age,
      'description': instance.description,
      'filmBgTrailer': instance.filmBgTrailer,
      'cast': instance.cast,
    };
