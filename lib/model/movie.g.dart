// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String? ?? 'Unknown Title',
      originalTitle: json['original_title'] as String? ?? 'Unknown',
      overview: json['overview'] as String? ?? 'No overview available',
      posterPath: json['poster_path'] as String? ?? '',
      backdropPath: json['backdrop_path'] as String?,
      mediaType: json['media_type'] as String? ?? 'movie',
      adult: json['adult'] as bool? ?? false,
      originalLanguage: json['original_language'] as String? ?? 'en',
      genreIds: (json['genre_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] as String? ?? 'Unknown',
      video: json['video'] as bool? ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
      runtime: (json['runtime'] as num?)?.toInt() ?? 0,
      cast: (json['cast'] as List<dynamic>?)
              ?.map((e) => CastMember.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'media_type': instance.mediaType,
      'adult': instance.adult,
      'original_language': instance.originalLanguage,
      'genre_ids': instance.genreIds,
      'popularity': instance.popularity,
      'release_date': instance.releaseDate,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'runtime': instance.runtime,
      'cast': instance.cast,
    };
